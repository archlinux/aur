# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Prostar
_pkgver=1.34.1
pkgname=r-${_pkgname,,}
pkgver=1.34.1
pkgrel=1
pkgdesc='Provides a GUI for DAPAR'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dapar
  r-dapardata
  r-data.table
  r-future
  r-ggplot2
  r-gplots
  r-highcharter
  r-htmlwidgets
  r-later
  r-promises
  r-rhandsontable
  r-shiny
  r-shinyace
  r-shinybs
  r-shinycssloaders
  r-shinyjqui
  r-shinyjs
  r-shinythemes
  r-tibble
  r-vioplot
  r-webshot
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-colourpicker
  r-dt
  r-gtools
  r-knitr
  r-r.utils
  r-rclipboard
  r-rcolorbrewer
  r-sass
  r-shinytree
  r-shinywidgets
  r-testthat
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('07bf4d888ce71f94d7f1a2103ef5dc0fc7f6df0286a63f99aec47274e4d0feb8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
