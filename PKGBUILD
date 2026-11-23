# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=omicsViewer
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive and explorative visualization of SummarizedExperssionSet or ExpressionSet using omicsViewer"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-beeswarm
  r-biobase
  r-curl
  r-drc
  r-dt
  r-fastmatch
  r-fgsea
  r-flatxml
  r-ggplot2
  r-ggseqlogo
  r-htmltools
  r-htmlwidgets
  r-httr
  r-matrixstats
  r-networkd3
  r-openxlsx
  r-plotly
  r-psych
  r-rcolorbrewer
  r-reshape2
  r-rocr
  r-rsqlite
  r-s4vectors
  r-shiny
  r-shinybusy
  r-shinycssloaders
  r-shinydashboard
  r-shinyjs
  r-shinythemes
  r-shinywidgets
  r-stringr
  r-summarizedexperiment
  r-survminer
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-unittest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2fdf431922e0e5fcd3dd33dc864e2ef1')
b2sums=('ffa734e47a58e995a46b4501dee092f0a758457dcaf4e75384d28b5959d7768ebfb92f2f9cc8d51d00bcd5c868e6f731f6a5ff9e35058918aca0d32341c72ee6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
