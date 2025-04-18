# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CiteFuse
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='CiteFuse: multi-modal analysis of CITE-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-compositions
  r-cowplot
  r-dbscan
  r-ggplot2
  r-ggraph
  r-ggridges
  r-gridextra
  r-igraph
  r-mixtools
  r-pheatmap
  r-randomforest
  r-rcpp
  r-reshape2
  r-rhdf5
  r-rlang
  r-rtsne
  r-s4vectors
  r-scales
  r-scran
  r-singlecellexperiment
  r-summarizedexperiment
  r-uwot
)
optdepends=(
  r-biocstyle
  r-dt
  r-exposition
  r-knitr
  r-mclust
  r-pkgdown
  r-rmarkdown
  r-scater
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('330708ed02fa13e4b16fa67a045178e7ba3ce6b1235f211f201cb7148fa95a1f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
