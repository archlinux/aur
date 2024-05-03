# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BASiCS
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=2.16.0
pkgrel=1
pkgdesc='Bayesian Analysis of Single-Cell Sequencing data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gcc
  r
  r-assertthat
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-coda
  r-cowplot
  r-ggextra
  r-ggplot2
  r-hexbin
  r-matrixstats
  r-posterior
  r-rcpp
  r-rcpparmadillo
  r-reshape2
  r-s4vectors
  r-scran
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-viridis
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magick
  r-rmarkdown
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dcca1ff275d9ed9e9c05be6d3ac8421f284ea75a9bad838c705b650b94458c65')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
