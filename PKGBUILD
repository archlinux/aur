# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=lima-gui
pkgname=lima-gui
pkgver=0.2.2
pkgrel=1
pkgdesc="Making a GUI for lima VM."
depends=('qtermwidget')
makedepends=('qt5-tools')
arch=('x86_64')
url="https://github.com/afbjorklund/lima-gui"
license=('MIT')
source=("https://github.com/afbjorklund/lima-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f6115c0743bca9c1fc0f8c763e4f96412e227576e118f61de725c75b22b13eb7')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  qmake && make
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
}
