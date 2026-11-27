# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=protGear
_pkgver=1.18.0
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
md5sums=('264920bdc328327563ab693d3af92259')
b2sums=('6c0db4d0de5567e99be48c6c085fdc679aeedcdc368811a0988a87d83a8ffc612b555209768774fadd3cfad95e4813c30ef86d8e98a637bc4f7ef19d98d5e959')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
