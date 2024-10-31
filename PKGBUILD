# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phyloseq
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='Handling and analysis of high-throughput microbiome census data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-ade4
  r-ape
  r-biobase
  r-biocgenerics
  r-biomformat
  r-biostrings
  r-data.table
  r-foreach
  r-ggplot2
  r-igraph
  r-multtest
  r-plyr
  r-reshape2
  r-scales
  r-vegan
)
optdepends=(
  r-biocstyle
  r-deseq2
  r-doparallel
  r-genefilter
  r-knitr
  r-magrittr
  r-metagenomeseq
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b6ac4086a97888a9090b6218eccd1bca98bd69f4c34d5be2f52de3adc5efc468')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
