# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=robslopes
_pkgver=1.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Algorithms for Robust Slopes"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b9497740da34f16f3e1676e69118f88e')
b2sums=('885e9d2f998c2c84b4070460f10847625775efac40baa49c60ba319b7d48cefa1b0cde8c2fbbee25aa7e5e46b7ef18f5fa9dc3e865781cefd040c47b74fa1b6f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
