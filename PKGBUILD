# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clevRvis
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization Techniques for Clonal Evolution"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(LGPL3)
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
md5sums=('43c9647c43af55cee12813e91c37f569')
sha256sums=('a4019b1410a607cde7dc2a6b53d6319c669c574fb5cb17fb86e37b03ac5050e8')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
