# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=swfdr
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Estimation of the science-wise false discovery rate and the false discovery rate conditional on covariates'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-ggplot2
  r-knitr
  r-qvalue
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d8eef65fec8cf7ffb0d6b984195d09269650b09893aba4eac089fab889abed67')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
