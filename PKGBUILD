# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GRENITS
_pkgver=1.50.2
pkgname=r-${_pkgname,,}
pkgver=1.50.2
pkgrel=1
pkgdesc='Gene Regulatory Network Inference Using Time Series'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-rcpp
  r-rcpparmadillo
  r-reshape2
)
optdepends=(
  r-network
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('579a8e3fae45e253ffd76c536a76a8bfb87ca6d8d3db5c3e4b2cf126ecc63e9b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
