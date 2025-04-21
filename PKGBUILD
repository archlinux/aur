# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=omicsViewer
_pkgver=1.12.0
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
md5sums=('12f1ac1893426b899e6b4c57e3ad51be')
b2sums=('90d3b495705fdc006b062764818e1ed2e3e2ede67a480be49711032dd49f0814f8ae59b08c05386dec0974831f79ef4f5afb9260527dce473734de7a2ce9ad5f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
