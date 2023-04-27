# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromstaR
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('e9f7f49b5d3d4b29dfb5b98ee30bb650adbb499da2ffc57f0e1520309baf2ce3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
