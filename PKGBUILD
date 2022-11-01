# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Prostar
_pkgver=1.28.6
pkgname=r-${_pkgname,,}
pkgver=1.28.6
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
sha256sums=('cf246dc018f1e7f2e4d6517535a91b8df27830660df529b84d2fa447d2fa5cce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
