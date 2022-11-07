# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scPipe
_pkgver=1.19.0
pkgname=r-${_pkgname,,}
pkgver=1.19.0
pkgrel=1
pkgdesc='pipeline for single cell RNA-seq data analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biomart
  r-dplyr
  r-genomicranges
  r-ggally
  r-ggplot2
  r-glue
  r-hash
  r-magrittr
  r-mclust
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rcpp
  r-reshape
  r-rhtslib
  r-rlang
  r-robustbase
  r-rtracklayer
  r-s4vectors
  r-scales
  r-scater
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-testthat
  r-zlibbioc
  gcc
  make
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rsubread
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a69ff5baf9057769895f537a65d7652efe4da03731774dd5486dc8bfc4e85e27')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
