# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=omicsViewer
_pkgver=1.18.0
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
md5sums=('d7895b80035e746ad7a34a9bc1e4aea9')
b2sums=('5eac19f63427076b464a0c08288d2d4f65f06bb5b1802250c69094bf3aa93fbc4b904515a27efe64f58d3593619cde630a26f83cc61bf0ca259a9c2e03a87dd1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
