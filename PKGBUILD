# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=restfulSE
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Access matrix-like HDF5 server content or BigQuery content through a SummarizedExperiment interface'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-bigrquery
  r-biobase
  r-dbi
  r-delayedarray
  r-dplyr
  r-experimenthub
  r-go.db
  r-magrittr
  r-reshape2
  r-rhdf5client
  r-rlang
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-restfulsedata
  r-rmarkdown
  r-rtsne
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a7dd17d5924dab7e5c5e6007e7795e357fde84e686f460ce93daf047f54e0218')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
