# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad
_pkgver=1.14.0
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
md5sums=('63dc10e6de925d7e03f96da4cc07c0aa')
b2sums=('653c4e4d9c0425a91b476d4251563dbfccc0e1f4946ea98419cfa14e77d39d111ba4b8f462ebca2f87fce374300228e44a48acccdf4440498d6f7dcc47503481')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
