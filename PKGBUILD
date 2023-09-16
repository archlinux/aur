# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima-gui
pkgver=0.3.1
pkgrel=2
pkgdesc="Making a GUI for lima VM."
arch=('x86_64')
url="https://github.com/afbjorklund/lima-gui"
license=('BSD')
depends=('lima' 'qt5-base')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/afbjorklund/lima-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('39e4b93bdae0b836faeeef295b3a5b30602f0002d61a2c18fd2c2345ec06a81f')

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
