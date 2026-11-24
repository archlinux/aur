# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=amplican
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
  r-genomicranges
  r-ggplot2
  r-ggthemes
  r-gridextra
  r-gtable
  r-iranges
  r-knitr
  r-matrixstats
  r-pwalign
  r-rcpp
  r-rlang
  r-rmarkdown
  r-s4vectors
  r-seqinfo
  r-shortread
  r-stringr
)
optdepends=(
  r-biocstyle
  r-genomicalignments
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('731397ed6adce3c540ef3cc8ed0f29a3902b10541b1748172c8ade354cafb33f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
