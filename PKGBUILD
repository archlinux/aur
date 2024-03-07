# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proto
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Prototype Object-Based Programming"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ba74c21febd5282d73e97ccaf5ebbb84')
b2sums=('9a6b7830558dc3d5b64b686b0f110bf784c02d4f82144936abc931572f0fd5dc60cbf48d1f60361dcc2522945c9f8c49c8c45799046002813efc64214b4c0b71')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
