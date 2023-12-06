# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=automap
_pkgver=1.1-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automatic Interpolation Package"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('f3070aed385352d2595ceddd74cb03cd71965f2e60b675832d16ec2ead6f3a43')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
