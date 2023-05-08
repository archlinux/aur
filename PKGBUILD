# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=amplican
_pkgver=1.22.1
pkgname=r-${_pkgname,,}
pkgver=1.22.1
pkgrel=1
pkgdesc='Automated analysis of CRISPR experiments'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggthemes
  r-gridextra
  r-gtable
  r-iranges
  r-knitr
  r-matrixstats
  r-rcpp
  r-rmarkdown
  r-s4vectors
  r-shortread
  r-stringr
  r-waffle
)
optdepends=(
  r-biocstyle
  r-genomicalignments
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('87358a39e7499e0ebcc91422282cbecf9aa372e9c9f23f8afc5c6f79b9229aaf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
