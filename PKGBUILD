# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOsummaries
_pkgver=2.32.0
pkgname=r-${_pkgname,,}
pkgver=2.32.0
pkgrel=1
pkgdesc='Word cloud summaries of GO enrichment analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gprofiler
  r-gtable
  r-limma
  r-plyr
  r-rcpp
  r-reshape2
)
optdepends=(
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cab95eec6e66ba4a56903f24c40232bdec8ff1dce5a42391d3357da7e1a16a72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
