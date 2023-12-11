# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=omicsViewer
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive and explorative visualization of SummarizedExperssionSet or ExpressionSet using omicsViewer"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r-beeswarm
  r-biobase
  r-curl
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
md5sums=('7d650ff242a133610199a574a29abfde')
sha256sums=('e5a3f73a0ab5cac65eb8b341aae0ba77910aefd9c7e64042634e9b37748a4dd5')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
