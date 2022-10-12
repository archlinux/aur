# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=xmlparsedata
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=1.0.5
pkgrel=4
pkgdesc='R code parse data as an XML tree'
arch=('any')
url='https://github.com/r-lib/xmlparsedata'
license=('MIT')
depends=(
  r
)
optdepends=(
  r-covr
  r-testthat
  r-xml2
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/r-lib/xmlparsedata/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89c58d560d0059e6b5481f41b4e7890fa457418ce7cb85e17974b4e63029f3bf')

build() {
  R CMD INSTALL ${_pkgname}-${pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
