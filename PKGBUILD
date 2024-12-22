# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Open Cancer TherApeutic Discovery (OCTAD)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biobase
  r-data.table
  r-deseq2
  r-dplyr
  r-edaseq
  r-edger
  r-experimenthub
  r-foreach
  r-ggplot2
  r-gsva
  r-htmlwidgets
  r-httr
  r-limma
  r-magrittr
  r-octad.db
  r-plotly
  r-qpdf
  r-reshape2
  r-rfast
  r-rhdf5
  r-ruvseq
  r-s4vectors
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f1bd72460f38e4ef66241fa979e2a6cc')
b2sums=('6c220aee55a9598a6b8a238f17a10c6ce31029f311c0a97e9f90c12842e6a3ad6e6cece1379a3a76e2cedac4c3d1d170ebf0a7200b52c96e34654025892c034c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
