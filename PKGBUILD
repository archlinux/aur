# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rqc
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Quality Control Tool for High-Throughput Sequencing Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biocstyle
  r-biostrings
  r-biovizbase
  r-genomicalignments
  r-genomicfiles
  r-ggplot2
  r-iranges
  r-knitr
  r-markdown
  r-plyr
  r-rcpp
  r-reshape2
  r-rsamtools
  r-s4vectors
  r-shiny
  r-shortread
)
optdepends=(
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('944400277abefec9acade45df52beb77bc8907c3e4e306b1f96ec043595d8597')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
