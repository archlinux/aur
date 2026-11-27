# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=signatureSearch
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Environment for Gene Expression Searching Combined with Functional Enrichment Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-delayedarray
  r-dose
  r-dplyr
  r-experimenthub
  r-fastmatch
  r-fgsea
  r-ggplot2
  r-go.db
  r-gseabase
  r-hdf5array
  r-magrittr
  r-org.hs.eg.db
  r-qvalue
  r-rcpp
  r-reactome.db
  r-readr
  r-reshape2
  r-rhdf5
  r-rsqlite
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-visnetwork
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-rmarkdown
  r-signaturesearchdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b1156846d154b7efa0bd65c54e7155ce67ba5cba6e66ace97f41d244a9a8beb2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
