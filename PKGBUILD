# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=supersm
_pkgname=SuperSM
pkgver=0.3
pkgrel=2
pkgdesc="A Super Symlink Manager"
arch=("any")
url="https://github.com/peeweep/SuperSM"
license=('MIT')
makedepends=('boost' 'cmake' 'make')
source=("${_pkgname}-${pkgver}.tar.gz"::${url}/archive/${pkgver}.tar.gz)
sha256sums=('54cad12a90d7cde1a7cb2e14243a69862dfc0113dbafd28a7a4469fea28a3318')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake ..
  make
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/build/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
