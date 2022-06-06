# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=savR
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('53b428c5495a1366e5ff16c1c8bb16601c277414cd990a90bc769bece970f413')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
