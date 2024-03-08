# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima-gui
pkgver=0.4.1
pkgrel=2
pkgdesc="Making a GUI for lima VM."
arch=('x86_64')
url="https://github.com/afbjorklund/lima-gui"
license=('BSD')
depends=('lima' 'qt5-base')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/afbjorklund/lima-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('56f725167d4833873c97dfda9c6810b8ab00c15834e46010e668da510a25677b')

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
