# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sangeranalyseR
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('bb78a73fb0a50472148181d82345a25f8d996e85040444274d618141dab1c2b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
