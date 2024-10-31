# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CGHregions
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='Dimension Reduction for Array CGH Data with Minimal Information Loss.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-cghbase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2fe60b1a4edd831f0c569e6638b370e10c9411dd5162fe000b69a20a0808a4fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
