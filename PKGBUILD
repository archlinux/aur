# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=savR
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Parse and analyze Illumina SAV files'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-ggplot2
  r-gridextra
  r-reshape2
  r-scales
  r-xml
)
optdepends=(
  r-cairo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9e5e4aaaf34bd87d813cd72fdddc035695c537673c249c6d9b8f9a2ce493f3ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
