# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeSummarizedExperiment
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=2.10.0
pkgrel=1
pkgdesc='TreeSummarizedExperiment: a S4 Class for Data with Tree Structures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-dplyr
  r-iranges
  r-rlang
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-treeio
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-ggtree
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cf7cd38f3199dc9324b6dbedd40ce2fae4c910abd0b11c41d7eaaa1d698f78fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
