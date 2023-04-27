# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TypeInfo
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
pkgrel=1
pkgdesc='Optional Type Specification Prototype'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
)
optdepends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fbc0e65704c19e88273ecb91b4f1db1ddc15c87442fb1be67441a843f2320ecc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
