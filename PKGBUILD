# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clevRvis
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('9d3bab94b6ad7749c1edb228aadfc8f4')
b2sums=('1ec1774ba1c7e4d3eb2142589c59635fc80ac5d3564f725ffaaed956724bf08a0280ab101d8426837897c3b9286267dcf6cc6a4f2693f3b770912c82d74b1b2a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
