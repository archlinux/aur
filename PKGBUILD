# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RefPlus
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
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
sha256sums=('73a5b6e71746e298a9f4611b8d74bbfed84815169cacd615fcf91eb7189d1260')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
