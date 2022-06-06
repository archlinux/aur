# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sangeranalyseR
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=1.6.1
pkgrel=3
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
sha256sums=('84cd1ff9819d5fca626c5b6a0ad5376881e8dd1b4c9702fa9f4072570337e362')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
