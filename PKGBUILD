# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=protGear
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Protein Micro Array Data Management and Interactive Visualization"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-data.table
  r-dplyr
  r-factoextra
  r-factominer
  r-flexdashboard
  r-genefilter
  r-ggally
  r-ggplot2
  r-ggpubr
  r-gtools
  r-htmltools
  r-kendall
  r-knitr
  r-limma
  r-magrittr
  r-pheatmap
  r-plotly
  r-plyr
  r-purrr
  r-readr
  r-remotes
  r-rlang
  r-rmarkdown
  r-shiny
  r-shinydashboard
  r-styler
  r-tibble
  r-tidyr
  r-vsn
)
optdepends=(
  r-ggplotify
  r-gridextra
  r-magick
  r-png
  r-scales
  r-shinyalert
  r-shinycssloaders
  r-shinyfeedback
  r-shinyfiles
  r-shinyjs
  r-shinythemes
  r-shinywidgets
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dbb65358a0d3538a059deee4dabad77d')
b2sums=('a13755d691b9e342f8cc51a107ea150c149eb581fde24f760907dc8825fce870a11f00b7193221fec7f3cfd2ffc9eea628a9404e10fafc97429063d130ff74fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
