# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=automap
_pkgver=1.1-20
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
md5sums=('2d89a7f00e6a8e11e4c1a87a7aea6c21')
b2sums=('f79051afb53ef92889803890f62eb2560daf1d2cc57b5948bf5103a9873548c211526a5b3169b43e8c004715bb668cdf1d45aea2457a6bb281233ec0c6ca6205')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
