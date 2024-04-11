# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=textshape
_pkgver=1.7.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tools for Reshaping Text"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-data.table
  r-slam
  r-stringi
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b92a38c5024eed8bf087992fa3465795')
b2sums=('6357863ae6d220b8aac2aef6f9be0b60e86b25b4146f611bed83731b3d98e1e9ad6f3ab12bc4304a17e95863ca6f5f54ee479308c0aa6a96188ecdf072c91d95')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
