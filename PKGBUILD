# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=preprocessCore
_pkgver=1.60.1
pkgname=r-${_pkgname,,}
pkgver=1.60.1
pkgrel=1
pkgdesc='A collection of pre-processing functions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6122b13180a692ecb2cc1816e479aea1fbddcbcfa8cfd01deb033672651899e7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
