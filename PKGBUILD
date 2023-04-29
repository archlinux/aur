# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=projectR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('b2ea16b9fee9fb69d26199519ebb8eab539ff47faa39dba6d1200c5eaf53d2b0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
