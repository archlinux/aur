# system requirements: C++11
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=eds
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='eds: Low-level reader for Alevin EDS format'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-knitr
  r-testthat
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1fb4d9929858243a2a144ea0b958e58c1ee1dce5a4f2c47530f73ba88011e96f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
