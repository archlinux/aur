# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=systemfit
_pkgver=1.1-30
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimating Systems of Simultaneous Equations"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-car
  r-lmtest
  r-sandwich
)
optdepends=(
  r-knitr
  r-plm
  r-sem
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ce0cf8a69c9c3c0f916c2d32770803c1')
sha256sums=('5994fbb81f1678325862414f58328cdc2c46d47efa1f23218e9416a4da431ce2')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
