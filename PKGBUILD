# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=automap
_pkgver=1.1-16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automatic Interpolation Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ggplot2
  r-gstat
  r-reshape
  r-sf
  r-sp
  r-stars
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ac0c9079ecd70cbb304a10c4d92983a5')
b2sums=('906a6329a89613eff71b53560a796868e9560914bcffa836acaffe4f4ac5d5a2fbadb685b56636025fa0e0b021537ad9c6af63c113eb81e7d4e2f74b0792adcb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
