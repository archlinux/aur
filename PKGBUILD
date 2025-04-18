# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LOLA
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Locus overlap analysis for enrichment of genomic ranges'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-genomicranges
  r-iranges
  r-reshape2
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-parallel
  r-qvalue
  r-rmarkdown
  r-simplecache
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d0eaf66817c3c13d0c0dbad279080a304c19e468a86c52ec11ae0db2f391ee4c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
