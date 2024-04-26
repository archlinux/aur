# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clevRvis
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Visualization Techniques for Clonal Evolution"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-colorspace
  r-colourpicker
  r-cowplot
  r-dplyr
  r-dt
  r-ggiraph
  r-ggnewscale
  r-ggplot2
  r-ggraph
  r-htmlwidgets
  r-igraph
  r-magrittr
  r-patchwork
  r-purrr
  r-r.utils
  r-readr
  r-readxl
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinyhelper
  r-shinywidgets
  r-tibble
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('96fde7a442a2cdb69754ebf1e68ccc65')
b2sums=('a17af95ed6c85a913e8cdaaffa70eefa59803d1c0e1f9ea41946ade51375ce887beaef475ae6be54b4ae8e1037896d3af4cf9baf90f40bf3df30388a2ce4a357')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
