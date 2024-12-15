# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TCseq
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Time course sequencing data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-e1071
  r-edger
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-iranges
  r-locfit
  r-reshape2
  r-rsamtools
  r-summarizedexperiment
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('25c7f0f582d009c61e9dcb1fb8f868ab87be334eaa8c7c3b9c496d5fbad45236')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
