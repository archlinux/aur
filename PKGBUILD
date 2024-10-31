# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=levi
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Landscape Expression Visualization Interface'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-colorspace
  r-dplyr
  r-dt
  r-ggplot2
  r-httr
  r-igraph
  r-knitr
  r-rcolorbrewer
  r-rcpp
  r-reshape2
  r-rmarkdown
  r-shiny
  r-shinydashboard
  r-shinyjs
  r-testthat
  r-xml2
)
optdepends=(
  r-biocstyle
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('835062151d468b3891be86da60915e0950d9d7e0a1b4374ee8730897c98e19d7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
