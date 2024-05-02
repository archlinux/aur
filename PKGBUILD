# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=UCell
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=2.8.0
pkgrel=1
pkgdesc='Rank-based signature enrichment analysis for single-cell data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocneighbors
  r-biocparallel
  r-data.table
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-patchwork
  r-reshape2
  r-rmarkdown
  r-scater
  r-scrnaseq
  r-seurat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb8617224382e61a190fc2c5a074a24440dd8edd7f1787f0defbf1e673262627')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
