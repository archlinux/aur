# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=supersm
_pkgname=SuperSM
pkgver=0.2
pkgrel=1
pkgdesc="A Super Symlink Manager"
arch=("any")
url="https://github.com/peeweep/SuperSM"
license=('MIT')
depends=('boost-libs')
makedepends=('boost' 'cmake' 'make')
source=("${_pkgname}-${pkgver}.tar.gz"::${url}/archive/${pkgver}.tar.gz)
sha256sums=('19536d7df778b19594d2ade8f29af621cfe424663260cf5d23fe7a2293b839e5')

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
