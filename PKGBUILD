# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=levi
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
sha256sums=('23d67c3a73351989d31dc36e1eb458d7afde7542e512f97bd5242f5794d37666')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
