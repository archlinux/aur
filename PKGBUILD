# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scran
_pkgver=1.26.1
pkgname=r-${_pkgname,,}
pkgver=1.26.1
pkgrel=1
pkgdesc='Methods for Single-Cell RNA-Seq Data Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beachmat
  r-bh
  r-biocgenerics
  r-biocparallel
  r-biocsingular
  r-bluster
  r-delayedarray
  r-delayedmatrixstats
  r-dqrng
  r-edger
  r-igraph
  r-limma
  r-metapod
  r-rcpp
  r-s4vectors
  r-scuttle
  r-singlecellexperiment
  r-statmod
  r-summarizedexperiment
)
optdepends=(
  r-biobase
  r-biocstyle
  r-deseq2
  r-dynamictreecut
  r-hdf5array
  r-knitr
  r-monocle
  r-pheatmap
  r-residualmatrix
  r-rmarkdown
  r-scaledmatrix
  r-scater
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('97807bc6dcb6668d984b7b50e375b760ffc54550ad101adc24a27e1cdc450ceb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
