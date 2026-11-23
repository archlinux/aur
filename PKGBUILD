# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bsseq
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Analyze, manage and store bisulfite sequencing data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-beachmat
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-genomicranges
  r-gtools
  r-hdf5array
  r-iranges
  r-limma
  r-locfit
  r-permute
  r-r.utils
  r-rcpp
  r-rhdf5
  r-s4vectors
  r-scales
  r-seqinfo
  r-summarizedexperiment
  gcc
)
makedepends=(
  r-assorthead
)
optdepends=(
  r-batchtools
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsseqdata
  r-doparallel
  r-knitr
  r-matrix
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('749014668ce1a756a1fa000f9c8c7ac4a707a60de5c92ee0aa67de1559f97de6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
