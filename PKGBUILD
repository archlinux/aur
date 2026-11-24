# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cn.farms
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=1.60.0
pkgrel=1
pkgdesc='cn.FARMS - factor analysis for copy number estimation'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affxparser
  r-biobase
  r-dbi
  r-dnacopy
  r-ff
  r-oligo
  r-oligoclasses
  r-preprocesscore
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4c921dc72dfb5a6e6183c873b323fe24164b39b6f1e6a63fbaa7b79107c5c531')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
