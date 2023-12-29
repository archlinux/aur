# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=howmany
_pkgver=0.3-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="A lower bound for the number of correct rejections"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2a734431375a7214f6dc831ca004dc38')
b2sums=('aee401ad94d4be278d571a03c409ece86eadcf4d797dc697f4474fa2bbbd6194fa5277f044cfd9f24b15b6a3db6baaca42325aa52d542d3411ab43fa6d4bc39b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
