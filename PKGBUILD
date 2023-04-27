# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=monocle
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=2.28.0
pkgrel=1
pkgdesc='Clustering, differential expression, and trajectory analysis for single- cell RNA-Seq'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocviews
  r-combinat
  r-ddrtree
  r-dplyr
  r-fastica
  r-ggplot2
  r-hsmmsinglecell
  r-igraph
  r-irlba
  r-leidenbase
  r-limma
  r-matrixstats
  r-pheatmap
  r-plyr
  r-proxy
  r-qlcmatrix
  r-rann
  r-rcpp
  r-reshape2
  r-rtsne
  r-slam
  r-stringr
  r-tibble
  r-vgam
  r-viridis
)
optdepends=(
  r-destiny
  r-hmisc
  r-knitr
  r-scater
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('125717ef4c979848c29c6ee3b244c6ccf00da52c151110c58b13128d86e9f116')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
