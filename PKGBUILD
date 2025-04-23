# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=protGear
_pkgver=1.12.0
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
md5sums=('688e5d4584615931665a53e56b617c33')
b2sums=('0df609dcbb69eaa0336580e5debb7d9329dd802ccf2f0482f65d8d1579c040aae7ec7a15ee1b6f381cdcddfd12b8d90fef382646261db9c1d3c9f3e75ba2ee12')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
