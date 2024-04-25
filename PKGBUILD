# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=automap
_pkgver=1.1-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('e73467a1c2fa43bd4f4f536ec51ad71b')
b2sums=('76a53f530f4d17d27f3b70aca6d27b8539b6035caa0a406755e553b429cac386f4bb438ef115de859b6794356605ee824c72d975821f123c0da6cfb828d20678')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
