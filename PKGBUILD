# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBA
_pkgver=0.1-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Multilevel B-Spline Approximation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  r-bh
)
optdepends=(
  r-sp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8b0a70701c0a153352088e320d0204df')
b2sums=('8b8c8d27b0d596fa49b05d4b035fb4079f7947077f56cda102956e527ff7074b69039e985c26d6e3424d3bbc89f5ccbf6cc34ab92ef6a834a8ad2b28f2934016')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
