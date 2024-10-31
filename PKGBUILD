# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clevRvis
_pkgver=1.6.0
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
md5sums=('e9ed8135aece62b029a3a7876ce68f95')
b2sums=('d28efbddeab0652cca9a49fe4be0c5b791752ae392a6568f09de1804015eac9faf7029dd9a039e70da66a9b78aa14391d93a19a28d7c16fcb17dc5a24ad48b5a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
