# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adegenet
_pkgver=2.1.10
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
md5sums=('63003ec71b7a756243f28bbe9a864d70')
b2sums=('9b85c908e0549e616f67954e90b7390fe4374fa8e09f3d1f5c06985ac3298b86214263cf734cad883be90ef466276a49315361079a796ee18fc09b37477e553f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
