# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellaRepertorium
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Data structures, clustering and testing for single cell immune receptor repertoires (scRNAseq RepSeq/AIRR-seq)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-dplyr
  r-forcats
  r-generics
  r-glue
  r-progress
  r-purrr
  r-rcpp
  r-reshape2
  r-rlang
  r-s4vectors
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-broom
  r-broom.mixed
  r-cowplot
  r-ggdendro
  r-ggplot2
  r-ggraph
  r-igraph
  r-knitr
  r-lme4
  r-rcolorbrewer
  r-readr
  r-rmarkdown
  r-scater
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('889997291de453778993dd8d492dae5b10a1345fd243b1d32f504d40061bc8dc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
