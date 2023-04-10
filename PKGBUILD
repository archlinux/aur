# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5
_pkgver=2.42.1
pkgname=r-${_pkgname,,}
pkgver=2.42.1
pkgrel=1
pkgdesc='R Interface to HDF5'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-rhdf5filters
  r-rhdf5lib
)
optdepends=(
  r-biocstyle
  r-bit64
  r-dplyr
  r-ggplot2
  r-knitr
  r-microbenchmark
  r-mockery
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('10f6254c1f62e426a0658c69cfbf14a6e3408823ff5e6e1fb2efa1b450390f13')
options=(!lto !buildflags staticlibs)
build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
