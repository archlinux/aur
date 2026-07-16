# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ADAMgui
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Activity and Diversity Analysis Module Graphical User Interface'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-adam
  r-colorramps
  r-data.table
  r-dplyr
  r-dt
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-ggsignif
  r-go.db
  r-gridextra
  r-knitr
  r-rcolorbrewer
  r-reshape2
  r-shiny
  r-shinyjs
  r-stringi
  r-stringr
  r-testthat
  r-varhandle
)
optdepends=(
  r-biocstyle
  r-markdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e399ad9cf0726422e4e8bc81232008fe3e09ce2a57055ef154bcace27abb51d2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
