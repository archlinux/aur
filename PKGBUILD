# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima-gui
pkgver=0.5.0
pkgrel=2
pkgdesc="Making a GUI for lima VM."
arch=('x86_64')
url="https://github.com/afbjorklund/lima-gui"
license=('BSD')
depends=('lima' 'qt5-base' 'qt5-svg')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/afbjorklund/lima-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('71099292be97ab648a29c51c32d4b9c2dec750d2fdaaaa9e3721d2bcf63e0deb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
