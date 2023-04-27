# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOsummaries
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=2.36.0
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
sha256sums=('22a3825ad7440060f8b424f412c00b3b67fe1018b131d0c3b761275fd81ef9b3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
