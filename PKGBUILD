# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=faraway
_pkgver=1.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions and Datasets for Books by Julian Faraway"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-lme4
)
optdepends=(
  r-leaps
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('526488c5aa96fc1b152b922f28053feb')
sha256sums=('e42b380054908aa280cebcaff9e3c099a11ae3f26fc278b424274f76dbb89570')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
