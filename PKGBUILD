# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adegenet
_pkgver=2.1.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Exploratory Analysis of Genetic and Genomic Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ade4
  r-ape
  r-dplyr
  r-ggplot2
  r-igraph
  r-reshape2
  r-seqinr
  r-shiny
  r-vegan
)
optdepends=(
  r-adespatial
  r-hierfstat
  r-interp
  r-maps
  r-pegas
  r-poppr
  r-spdep
  r-splancs
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c13d5d34e87439954dcf02bba50f76c7')
b2sums=('9805abf80b7bf3df4462c0d71ad52cf3c803441596107ceddf3d1716d641bf176935cf19f33a5cab9249f22cda3f4dc90f826890fe46e666bc0526c8b3c1e7b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
