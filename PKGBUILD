# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffHic
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Differential Analyis of Hi-C Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-csaw
  r-edger
  r-genomeinfodb
  r-genomicranges
  r-interactionset
  r-iranges
  r-limma
  r-locfit
  r-rcpp
  r-rhdf5
  r-rhtslib
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-zlibbioc
  gcc
  make
)
optdepends=(
  r-bsgenome.ecoli.ncbi.20080805
  r-matrix
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb4a82dc20c22e7be7eb664680449bd8f855d43e76b65b07c1b4f67bd9d10675')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
