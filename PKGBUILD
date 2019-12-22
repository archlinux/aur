# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=supersm
_pkgname=SuperSM
pkgver=0.1
pkgrel=1
pkgdesc="A Super Symlink Manager"
arch=("any")
url="https://github.com/peeweep/SuperSM"
license=('MIT')
depends=('boost-libs')
makedepends=('boost' 'cmake' 'make')
source=("${_pkgname}-${pkgver}.tar.gz"::${url}/archive/${pkgver}.tar.gz)
sha256sums=('e701b96260889d898c33e59a4960ab7c264ac0be11719f25647bcdbaac025bf1')

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
