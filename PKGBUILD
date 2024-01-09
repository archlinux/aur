# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SingleR
_pkgver=2.4.1
pkgname=r-${_pkgname,,}
pkgver=2.4.1
pkgrel=1
pkgdesc='Reference-Based Single-Cell RNA-Seq Annotation'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beachmat
  r-biocneighbors
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-delayedmatrixstats
  r-rcpp
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-celldex
  r-ggplot2
  r-grdevices
  r-gridextra
  r-knitr
  r-pheatmap
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-scuttle
  r-singlecellexperiment
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4d8fb557544732511d3ae2e25959fb3f53c6756b2da5db6f2cce69155b219b7e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
