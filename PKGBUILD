# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima-gui
pkgver=0.2.2
pkgrel=2
pkgdesc="Making a GUI for lima VM."
arch=('x86_64')
url="https://github.com/afbjorklund/lima-gui"
license=('BSD')
depends=('lima' 'qt5-base')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/afbjorklund/lima-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f6115c0743bca9c1fc0f8c763e4f96412e227576e118f61de725c75b22b13eb7')

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
