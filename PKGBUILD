# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tictoc
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Functions for Timing R Scripts, as Well as Implementations of \"Stack\" and \"StackList\" Structures"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dd342dc02c50975774dde3baf3773767')
b2sums=('55417244b344a3ec78679454893502ec77964249bf943b0f27311b8331f08acd1269fa47e220ba0e36c35294b67b2fa0025a97b73828cf2500af776d32d757e4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
