# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=psichomics
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Graphical Interface for Alternative Splicing Quantification, Analysis and Visualisation'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-biocfilecache
  r-colourpicker
  r-data.table
  r-digest
  r-dplyr
  r-dt
  r-edger
  r-fastica
  r-fastmatch
  r-ggplot2
  r-ggrepel
  r-highcharter
  r-htmltools
  r-httr
  r-jsonlite
  r-limma
  r-pairsd3
  r-plyr
  r-purrr
  r-r.utils
  r-rcpp
  r-recount
  r-reshape2
  r-rfast
  r-shiny
  r-shinybs
  r-shinyjs
  r-stringr
  r-summarizedexperiment
  r-xml
  r-xtable
)
optdepends=(
  r-car
  r-covr
  r-devtools
  r-gplots
  r-knitr
  r-parallel
  r-rmarkdown
  r-rstudioapi
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d0f3509fc41154d2cefd21ebbf308eca45a8effe581f42c15df3a2eee5e9e989')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
