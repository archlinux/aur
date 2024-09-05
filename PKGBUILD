# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MouseFM
_pkgver=1.14.5
pkgname=r-${_pkgname,,}
pkgver=1.14.5
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
sha256sums=('54b4cf056094e5dca0bf3b6958b3f3474edc3cfe9626af8eca907cad243358d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
