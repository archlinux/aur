# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scGPS
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=1.12.1
pkgrel=1
pkgdesc='A complete analysis of single cell subpopulations, from identifying subpopulations to analysing their relationship (scGPS = single cell Global Predictions of Subpopulation)'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-caret
  r-deseq2
  r-dplyr
  r-dynamictreecut
  r-fastcluster
  r-ggplot2
  r-glmnet
  r-locfit
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
  r-singlecellexperiment
  r-summarizedexperiment
  make
)
optdepends=(
  r-biocparallel
  r-clusterprofiler
  r-cowplot
  r-dendextend
  r-devtools
  r-dose
  r-e1071
  r-knitr
  r-matrix
  r-networkd3
  r-org.hs.eg.db
  r-parallel
  r-rcolorbrewer
  r-reactomepa
  r-reshape2
  r-rmarkdown
  r-rtsne
  r-testthat
  r-wgcna
  r-xlsx
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b00a161a3f95790875d293c761e0c8c7396fc60f9e2a56a953162c69d9593a19')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
