# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=batchelor
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Single-Cell Batch Correction Methods'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beachmat
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-delayedmatrixstats
  r-igraph
  r-rcpp
  r-residualmatrix
  r-s4vectors
  r-scaledmatrix
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  gcc
)
optdepends=(
  r-biocstyle
  r-bluster
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5f6047399a16d3ebbcb031d09f7f41300a26471c5b2df221fce022d5d198cead')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
