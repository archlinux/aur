# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=omicsViewer
_pkgver=1.10.0
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
md5sums=('239148f41b6a545addcf27cf6489fe14')
b2sums=('55141ad7fdbbec1bbb4d4987c97673803b796a74524cb749c58e2f565d72b8c7ab489628536b09f4980b1f30fcf860fefe3a05d1d374647af4f5c0625b2a809e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
