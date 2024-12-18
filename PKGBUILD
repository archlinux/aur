# system requirements: GNU make, PhISCS (optional)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mitoClone2
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Clonal Population Identification in Single-Cell RNA-Seq Data using Mitochondrial and Somatic Mutations'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-deepsnv
  r-genomicranges
  r-ggplot2
  r-pheatmap
  r-reshape2
  r-rhtslib
  r-s4vectors
  make
)
optdepends=(
  r-biostrings
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e98571c02a0c3ac01f164b30009936e3e96773363946d9e0368588b9f94524b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
