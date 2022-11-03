# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CiteFuse
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='CiteFuse: multi-modal analysis of CITE-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-dbscan
  r-ggplot2
  r-ggraph
  r-ggridges
  r-gridextra
  r-igraph
  r-mixtools
  r-pheatmap
  r-propr
  r-randomforest
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
sha256sums=('392e26d1c2e44c7f9fb0df9746eac31a0ba3fdcaf4b55fc9cc283fccf72aee13')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
