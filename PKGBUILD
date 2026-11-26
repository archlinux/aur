# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=transite
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='RNA-binding protein motif analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-dplyr
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-rcpp
  r-scales
  r-stringr
  r-tfmpvalue
  gcc
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('19e32548a2088d9f635ba2c1fa71a0da0a2f840892b7122e8ad3e1d8c0afd8c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
