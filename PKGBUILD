# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=automap
_pkgver=1.1-12
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
md5sums=('5540097d49d4c093322d26dde8e94da7')
b2sums=('edb12e08f5442f330e60c1ded035a9d83b8c873cfb438ba79a25139a8e23b2ef73d7a86c490b44199a044a6af9ab826de73a5ef4d5ee20d413ed0eb83d4ada94')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
