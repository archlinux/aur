# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CrispRVariants
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
  r-genomicfeatures
  r-knitr
  r-readxl
  r-rmarkdown
  r-rtracklayer
  r-sangerseqr
  r-testthat
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a2ee741c49a2107ffb6e77e6d26e503433ac4cd1b6d3e64f618a5268e85f0e39')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
