# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=projectR
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=1
pkgdesc='Functions for the projection of weights from PCA, CoGAPS, NMF, correlation, and clustering'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cogaps
  r-dplyr
  r-ggalluvial
  r-ggplot2
  r-limma
  r-nmf
  r-rcolorbrewer
  r-reshape2
  r-rocr
  r-scales
  r-viridis
)
optdepends=(
  r-biocstyle
  r-complexheatmap
  r-devtools
  r-grid
  r-gridextra
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('90ae3776dd016d08520fc118f7fa4598c974298cd5e48741b5dad1f4a019f517')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
