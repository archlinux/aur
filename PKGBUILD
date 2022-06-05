# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ADAMgui
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('7a69887afde852f1d8f6038d9b98c9c33c96f71e7d987fde3f99b9c91b2e6d6f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
