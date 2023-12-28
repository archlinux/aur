# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pls
_pkgver=2.8-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Partial Least Squares and Principal Component Regression"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL2)
depends=(
  r
)
optdepends=(
  r-rmpi
  r-runit
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3206a18410583f0672f02cac9dbedce5')
b2sums=('0f403612c86ce91b40e810f4311c69e0d965dc96b1ec6b9a56a7ae2b7603f0051f0f72079ad318cbe7e933122942fc422f6da3746db823d8e2dd9949222e8333')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
