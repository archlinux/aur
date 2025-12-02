# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=levi
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('440485f7a84f04e59de9c88fbde540defa14268252a298675a81d901326e6158')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
