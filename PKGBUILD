# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clevRvis
_pkgver=1.4.0
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
md5sums=('5451901f0189a26e4056b87a03188a81')
b2sums=('cca12c861f27d7de0821bf98e7ba06d6ed7b7757c677f14a521f120bf48f3118586514374701937e1d8a78feae362141238166d0745f99b2b91791ec4485d1e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
