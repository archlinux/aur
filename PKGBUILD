# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=imageHTS
_pkgver=1.45.1
pkgname=r-${_pkgname,,}
pkgver=1.45.1
pkgrel=1
pkgdesc='Analysis of high-throughput microscopy-based screens'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-cellhts2
  r-e1071
  r-ebimage
  r-hwriter
  r-vsn
)
optdepends=(
  r-biocstyle
  r-mass
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('550bec6b7b74d187a363828e43394d56f0980393d19ed1f927f5eda0750d9ba1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
