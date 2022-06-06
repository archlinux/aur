# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenoGAM
_pkgver=2.11.0
pkgname=r-${_pkgname,,}
pkgver=2.11.0
pkgrel=3
pkgdesc='A GAM based framework for analysis of ChIP-Seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biostrings
  r-data.table
  r-delayedarray
  r-deseq2
  r-futile.logger
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-hdf5array
  r-iranges
  r-rcpp
  r-rcpparmadillo
  r-rhdf5
  r-rsamtools
  r-s4vectors
  r-sparseinv
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-chipseq
  r-genefilter
  r-ggplot2
  r-knitr
  r-lsd
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('727bbbceb6425360310ba948f99ea70346cc4564b0adaa599aa27e00458f1815')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
