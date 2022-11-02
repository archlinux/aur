# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ITALICSData
_pkgver=2.35.0
pkgname=r-${_pkgname,,}
pkgver=2.35.0
pkgrel=1
pkgdesc='ITALICSData'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0e2911c99534c7a50e158659ddbb8d51b005dea57edab8d8d81c60d0d124850d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
