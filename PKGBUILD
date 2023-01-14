# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BASiCS
_pkgver=2.10.4
pkgname=r-${_pkgname,,}
pkgver=2.10.4
pkgrel=1
pkgdesc='Bayesian Analysis of Single-Cell Sequencing data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
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
  r-rcpp
  r-rcpparmadillo
  r-reshape2
  r-s4vectors
  r-scran
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-viridis
  gcc
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magick
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d163d89590afa367cf8468cb3966c0f47e1ca53f202d4d0a617751ede42b6ec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
