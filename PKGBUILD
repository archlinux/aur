# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DNAshapeR
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='High-throughput prediction of DNA shape features'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-fields
  r-genomicranges
  r-rcpp
)
optdepends=(
  r-annotationhub
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-caret
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0a536bf0667cb33576ba3c989c0c4be31c12df19f6aad6642b0dd8399cb34132')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
