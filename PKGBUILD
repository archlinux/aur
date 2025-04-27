# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad
_pkgver=1.9.0
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
md5sums=('ef7599273b99997b87f05720915b9b4b')
b2sums=('fc20c7cfe1079122f57a9227bf61cf5588916ee3f6db2547d889a39328e094b1e63efc7ccdd9af8ed57381a0b51b82e22da1974263941c5b244063b91f5e687f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
