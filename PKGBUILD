# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=easycsv
_pkgver=1.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Load Multiple 'csv' and 'txt' Tables"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-data.table
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8f0af88db5c05b948f585bd954fa26e6')
b2sums=('e36941d4f9d858d613a04038438b581fd6f062127b7992080c6b8be81d76135c7d1243f9b15c92f25ac8ba75741eb90f6a9e965d0065b655aa56432778205af1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
