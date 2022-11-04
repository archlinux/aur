# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AneuFinderData
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='WGSCS Data for Demonstration Purposes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('905b47edbd5c3192669a827f985966eb6f93bff2d889740c8afa1af23578e405')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
