# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PopGenReport
_pkgver=3.1.3
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
md5sums=('2d0c49e07f163b2722b6c0f55757048e')
b2sums=('9131fef428a3e263fa6300f171ab6f2029ea329224ad74f498c836e46a13251a786cd4ea690090aa65cb877c1c7c5f49ba06132cf5ffe6f69e80f866d17a18d7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
