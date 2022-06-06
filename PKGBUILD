# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OVESEG
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='OVESEG-test to detect tissue/cell-specific markers'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-fdrtool
  r-limma
  r-rcpp
  r-summarizedexperiment
  gcc
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-grid
  r-gridextra
  r-knitr
  r-reshape2
  r-rmarkdown
  r-scales
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d1c843b7d97849505e37f2ba858b4de61b000ebe01df88725b439d17c20de5a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
