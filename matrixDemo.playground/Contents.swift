//: Playground - noun: a place where people can play

import UIKit
//从一个M*N的矩阵中查找是否有a*b的子矩阵，其中a<M,b<N, 返回矩阵的匹配的位置和个数。

//子矩阵：从一个矩阵当中选取某些行和某些列交叉位置所组成的新矩阵（保持行与列的相对顺序）被称为原矩阵的一个子矩阵。

//普遍性算法
/** 1. M*N 最多包含 a*b 子矩阵个数 (M- a + 1) *(N - b + 1)
    2.遍历 0 ~ (M - a)列 至 N - b 行 满足要求 == a * b 矩阵首个元素的位置，取子矩阵，进行遍历匹配。
    3.遇到不满足则 continue。直到结束*/

var matrix = [[Int]]()
var subMatrix = [[Int]]()

//M*N
matrix = [
    [1,2,3,5],
    [4,1,6,6],
    [1,2,2,2],
    [4,1,2,1]
    ]

//a*b
subMatrix = [
            [1,2],
            [4,1]
            ]

//首元素相同的话，直接依次匹配看是否相等(这样只能判断出连续性的子矩阵)
func subMatrixMatch(i : Int, j : Int) -> Bool {
    
    for m in 0..<subMatrix.count {
        
        for n in 0..<subMatrix[0].count {
            
            if matrix[i+m][j+n] != subMatrix[m][n] {
               
                return false
                
            }
            
        }
    }
//    print("true")

    return true
}

//查找不连续的子矩阵
//思路: 从首元素往右查找，如果找到符合的，在查找他对应行上（往下）的元素是否相同，如果相同，重复之前动作，知道完全匹配
func subMatrixMatch2(i : Int, j : Int) -> Bool {
    
    for m in 0..<subMatrix.count {
        
        if matrix[i+m] == subMatrix[m] {
            
        }
        for n in 0..<subMatrix[0].count {
            
        
            
            
        }
    }
    
    return true
}



for i in 0...(matrix.count - subMatrix.count) {
    
    for j in 0...(matrix[0].count - subMatrix[0].count) {
        
        if matrix[i][j] == subMatrix[0][0] {
            
            print("same first element")
            let isSame : Bool = subMatrixMatch(i: i, j: j)
            if  isSame {
                
                print("all same")

            }
            
        }
        
    }
    
}


/**
 其他想法:
 1.借鉴KMP算法思想
 将二维矩阵一维化，这个算法就类似于字符串的模式匹配，这个可以很快的跳过多个元素，从而减少复杂度
 2.组合法
   从M*N矩阵中，每行取出b列的个数，组合起来，然后去匹配a的行数，
              每列取出a行的个数，组合起来，然后去匹配b的列数，
  然后按顺序依次匹配，匹配到一个完整的子矩阵记为一个，然后依次匹配。
 3.尝试用二分查找法，对每行/列做二分查找，或者从对角线入手做二分查找
 4.如果遇到特殊子矩阵，可以从对角线（比如正方形的矩阵）入手
 或者具有单调性，那么可以用单调队列或者尺取法
 5.从外圈开始查找，然后一直剥皮似的匹配，
 6.分解矩阵(比如LU分解，QR分解，Jordan分解，SVD分解),尝试去分解矩阵，减少时间复杂度,
   或者变换矩阵
 */



