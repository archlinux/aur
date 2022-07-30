# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Prostar
_pkgver=1.28.4
pkgname=r-${_pkgname,,}
pkgver=1.28.4
pkgrel=1
pkgdesc='Provides a GUI for DAPAR'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocmanager
  r-colourpicker
  r-dapar
  r-dapardata
  r-data.table
  r-dt
  r-future
  r-highcharter
  r-htmlwidgets
  r-later
  r-promises
  r-r.utils
  r-rclipboard
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
  r-webshot
  r-xml
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('564bba161d5b5715090629ecaca3af1575107b1cd4f48b1a88f56b45a9d08c70')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
