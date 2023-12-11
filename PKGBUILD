# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=protGear
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Protein Micro Array Data Management and Interactive Visualization"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('db63dca71894a3ebbf3b8b78512bccb4')
sha256sums=('bb5b47b1b5d12faba813f71e962a7e9fe80ae6807aa7dca8cceacbbec5681565')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
