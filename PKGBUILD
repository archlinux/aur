# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RefPlus
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=1.68.0
pkgrel=1
pkgdesc='A function set for the Extrapolation Strategy (RMA+) and Extrapolation Averaging (RMA++) methods.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-affyplm
  r-biobase
  r-preprocesscore
)
optdepends=(
  r-affydata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a34a54eb04287739416e3775c07c6bcb3e8eaa29e01186b9d205fdf2d0f923be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
