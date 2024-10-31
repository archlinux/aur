# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=universalmotif
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Import, Modify, and Export Motifs with R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-ggplot2
  r-iranges
  r-matrixgenerics
  r-rcpp
  r-rcppthread
  r-rlang
  r-s4vectors
  r-yaml
)
optdepends=(
  r-ape
  r-biocparallel
  r-bookdown
  r-cowplot
  r-dplyr
  r-genomicranges
  r-ggbio
  r-ggseqlogo
  r-ggtree
  r-knitr
  r-motifdb
  r-motifstack
  r-processx
  r-pwmenrich
  r-rgadem
  r-rmarkdown
  r-seqlogo
  r-spelling
  r-testthat
  r-tfbstools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08946c2d8649d5ab66c93b5cb4c5abad1174e08f8492ee96ae971d409d6fd291')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
