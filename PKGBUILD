# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=amplican
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
sha256sums=('0cdf46c636732c0a53976aed6d2a0e6194e3ad956d82dbd012547dd8a74863f7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
