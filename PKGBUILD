# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CrispRVariants
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Tools for counting and visualising mutations in a target location'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocparallel
  r-biostrings
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-iranges
  r-reshape2
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-gdata
  r-genomicfeatures
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-sangerseqr
  r-testthat
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a1d89869ed62212175cae5c20004feeb843a0ce1d676f2f3f1a48e95fb18ba0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
