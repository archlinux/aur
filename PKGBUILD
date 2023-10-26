# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methimpute
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Imputation-guided re-construction of complete methylomes from WGBS data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-minpack.lm
  r-rcpp
  r-reshape2
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('16efff43478e8d2a09d80c4e6475eeb654f4936eb06fa28578face1de7eabb69')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
