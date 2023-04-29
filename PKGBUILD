# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=universalmotif
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('961d5463099d657a6bd79a6b45239bea13d1ad6fa64dc3aad17869e18930ec6c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
