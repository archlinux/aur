# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msPurity
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Automated Evaluation of Precursor Ion Purity for Mass Spectrometry Based Fragmentation in Metabolomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dbi
  r-dbplyr
  r-dosnow
  r-dplyr
  r-fastcluster
  r-foreach
  r-ggplot2
  r-magrittr
  r-mzr
  r-plyr
  r-rcpp
  r-reshape2
  r-rsqlite
  r-stringr
)
optdepends=(
  r-biocstyle
  r-camera
  r-knitr
  r-msnbase
  r-mspuritydata
  r-rmarkdown
  r-rmysql
  r-rpostgres
  r-testthat
  r-xcms
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7441d7635ee7b61a496724cb40f54da811dafab72b189a174a3400b24b20cb5e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
