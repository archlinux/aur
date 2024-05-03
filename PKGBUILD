# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylKit
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='DNA methylation analysis from high-throughput bisulfite sequencing results'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-data.table
  r-emdbook
  r-fastseg
  r-genomeinfodb
  r-genomicranges
  r-gtools
  r-iranges
  r-limma
  r-mclust
  r-qvalue
  r-r.utils
  r-rcpp
  r-rhtslib
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-zlibbioc
  make
)
optdepends=(
  r-biocmanager
  r-genomation
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b2b9989132f2861f7ed1d0bccff5cdc2f8d3aea670203cf092334a364cdc0d00')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
