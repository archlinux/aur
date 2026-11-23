# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=protGear
_pkgver=1.16.0
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
md5sums=('9ca827fc6f43c523053600d0fc177aef')
b2sums=('cc1b56a68dd404a39218fd6a9b915a9840e404bc6ae1c7abfc5e0975031c7c8be91ba4537b5b0a5fe0158b52ac06072d9fd1ca19cdbfd09facf8a00ee7621f70')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
