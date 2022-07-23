# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicDistributions
_pkgver=1.4.4
pkgname=r-${_pkgname,,}
pkgver=1.4.4
pkgrel=1
pkgdesc='GenomicDistributions: fast analysis of genomic intervals with Bioconductor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-biostrings
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-plyr
  r-reshape2
  r-broom
)
optdepends=(
  r-annotationfilter
  r-biocstyle
  r-bsgenome
  r-ensembldb
  r-extrafont
  r-genomicfeatures
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('14e8d708e68136e10d186a7693dc7bddac2a1f8a897ca3bab06634fbdd711f37')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
