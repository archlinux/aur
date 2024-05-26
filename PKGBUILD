# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Prostar
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Provides a GUI for DAPAR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
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
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e435ef7a7d19fce959b9c237a46a3bb6')
b2sums=('f73d74bb6c0ea3d7925d9ee49081b666a59fe6dbf446334f395148a8175959cbd73b24601d0ae9e5bc972db53c1d6973327912a721fad374ee5dacef44bfeb53')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
