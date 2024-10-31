# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sangeranalyseR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='sangeranalyseR: a suite of functions for the analysis of Sanger sequence data in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-biocstyle
  r-biostrings
  r-data.table
  r-decipher
  r-dt
  r-excelr
  r-ggdendro
  r-gridextra
  r-knitr
  r-logger
  r-openxlsx
  r-phangorn
  r-plotly
  r-reshape2
  r-rmarkdown
  r-sangerseqr
  r-seqinr
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinyjs
  r-shinywidgets
  r-stringr
  r-zeallot
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d63324934712a476d7b8c7fd371d40dee3a3a673dc00472df0b80d2421b2696c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
