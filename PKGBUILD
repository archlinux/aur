# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MouseFM
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='In-silico methods for genetic finemapping in inbred mice'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-curl
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gtools
  r-httr
  r-iranges
  r-jsonlite
  r-reshape2
  r-rlist
  r-scales
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a080d0e6bac984813cd660ed21c96d9e6b4d3eabc3c60fba16c72c0d53ad20d7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
