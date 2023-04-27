# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CGHcall
_pkgver=2.62.0
pkgname=r-${_pkgname,,}
pkgver=2.62.0
pkgrel=1
pkgdesc='Calling aberrations for array CGH tumor profiles.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-cghbase
  r-dnacopy
  r-impute
  r-snowfall
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f15eb54c95a106af0ac9ebfff4b8bce3e2c5e7b1300e6be0185318401590a809')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
