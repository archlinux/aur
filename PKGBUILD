# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LymphoSeq
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Analyze high-throughput sequencing of T and B cell receptors'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-circlize
  r-data.table
  r-dplyr
  r-ggplot2
  r-ggtree
  r-ineq
  r-lymphoseqdb
  r-msa
  r-phangorn
  r-plyr
  r-rcolorbrewer
  r-reshape
  r-stringdist
  r-upsetr
  r-venndiagram
)
optdepends=(
  r-knitr
  r-pheatmap
  r-rmarkdown
  r-wordcloud
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b13b3fa2c4406684d7e6c49249bda149f4c07a921994544eabf566a5c9ff2430')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
