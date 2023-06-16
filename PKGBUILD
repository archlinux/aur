# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QuasR
_pkgver=1.40.1
pkgname=r-${_pkgname,,}
pkgver=1.40.1
pkgrel=1
pkgdesc='Quantify and Annotate Short Reads in R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-iranges
  r-rbowtie
  r-rhtslib
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shortread
)
optdepends=(
  r-biocstyle
  r-covr
  r-genomicalignments
  r-gviz
  r-knitr
  r-rhisat2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6fbdb7af8ca383f91d7c27a4c4d7f20abf416172045dd94c0fbcdfb778d07623')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
