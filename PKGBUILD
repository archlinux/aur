# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromstaR
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Combinatorial and Differential Chromatin State Analysis for ChIP-Seq Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bamsignals
  r-biocgenerics
  r-chromstardata
  r-doparallel
  r-foreach
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-iranges
  r-mvtnorm
  r-reshape2
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-biomart
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a68b7767d8ae6961414a41786c8684cf5e508ba0ae19f824f1eb78743b66d3fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
