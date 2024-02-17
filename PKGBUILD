# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Prostar
_pkgver=1.34.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Provides a GUI for DAPAR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-colourpicker
  r-dapar
  r-dapardata
  r-data.table
  r-dt
  r-future
  r-ggplot2
  r-gplots
  r-gtools
  r-highcharter
  r-htmlwidgets
  r-knitr
  r-later
  r-markdown
  r-promises
  r-r.utils
  r-rclipboard
  r-rcolorbrewer
  r-rhandsontable
  r-sass
  r-shiny
  r-shinyace
  r-shinybs
  r-shinycssloaders
  r-shinyjqui
  r-shinyjs
  r-shinythemes
  r-shinytree
  r-shinywidgets
  r-tibble
  r-vioplot
  r-webshot
  r-xml
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9225eef1d1b01fb3a112281edf262491')
b2sums=('5808252df13f4d307f3eeaf8e893a25d9e86dacab1ea1bb27aec194e607df36d2d7c4a47f9cd4a9cfa9df575e951b2120bb810ecf224606e74d77c13767db7eb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
