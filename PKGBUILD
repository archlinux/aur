# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=signatureSearch
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Environment for Gene Expression Searching Combined with Functional Enrichment Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biocparallel
  r-clusterprofiler
  r-data.table
  r-delayedarray
  r-dose
  r-dplyr
  r-experimenthub
  r-fastmatch
  r-fgsea
  r-ggplot2
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
sha256sums=('13129c52eb89e4746684b1b2f06705cdb646c246ede984cebfcb4df33070ea6c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
