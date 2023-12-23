# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rmeta
_pkgver=3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Meta-Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL2)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b14aa174ad5bb7b8abb413a5aa4eacc0')
b2sums=('c982df7c0fa7dbcb92f29e243ae8efbeb6b59f9e257aed51e1f200263d0e7352c5fe45d1acb502ff56379b4cd0cd40670331ead254d3dcfc326d5f896f5149cd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
