# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=edge
_pkgver=2.32.0
pkgname=r-${_pkgname,,}
pkgver=2.32.0
pkgrel=1
pkgdesc='Extraction of Differential Gene Expression'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-qvalue
  r-snm
  r-sva
)
optdepends=(
  r-ggplot2
  r-knitr
  r-reshape2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cb1b8dcb250a3ad3abdfbf6adbdd9a6b1dac1647298ca1e32d1dfadf8b6511d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
