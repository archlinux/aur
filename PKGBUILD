# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BRGenomics
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=1
pkgdesc='Tools for the Efficient Analysis of High-Resolution Genomics Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-deseq2
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-apeglm
  r-biocstyle
  r-biostrings
  r-ggplot2
  r-knitr
  r-remotes
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4f644b893d3e4159fbf0dfe6eb68c074552625a5bd7a9a811ddbb063b3bb20f9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
