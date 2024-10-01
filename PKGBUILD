# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PopGenReport
_pkgver=3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Simple Framework to Analyse Population and Landscape Genetic Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ade4
  r-adegenet
  r-calibrate
  r-dismo
  r-gap
  r-gdistance
  r-genetics
  r-ggally
  r-ggplot2
  r-knitr
  r-mmod
  r-pegas
  r-plyr
  r-r.utils
  r-raster
  r-reshape2
  r-rgooglemaps
  r-sp
  r-vegan
  r-xtable
)
optdepends=(
  r-sf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b17b5e2a8a5bda48ca5ac8986d93380')
b2sums=('182b8d7c321f36a44d45c9fa7975e60522c6a115f07043f8b4be227bdda2f61c57a27fd13fcc633e668622792f4ce4aba15ecaf57e32c0358453156f145a64dc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
