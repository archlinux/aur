# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=agilp
_pkgver=3.30.0
pkgname=r-${_pkgname,,}
pkgver=3.30.0
pkgrel=1
pkgdesc='Agilent expression array processing package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('203388ce6ef8f95995d6518e4332a9fea54deb4601a491dce6aeeff008009c95')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
