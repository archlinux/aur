# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LOLA
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('2d4d2f5715fee18b08a6b32a76259ba7612cd0a00c0f3cfdaafa302e730bd301')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
