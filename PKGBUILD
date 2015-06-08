# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

buildarch=16

pkgname=qt5-qpa-rpi-plugin
pkgver=5.4.0
pkgrel=1
pkgdesc="Qt5 eglfs plugin built against Broadcom's GL libs."
url="http://qt.io"
arch=('armv6h' 'armv7h')
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt5-base' 'mtdev')
conflicts=('qt5-qpa-rpi-plugin-git')
source=("https://github.com/greenisland/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('b8a58bc5c438c11d105ece4b297d4cfc')

build() {
	cd ${pkgname}-${pkgver}/eglfs_rpi
	qmake
	make
}

package() {
	cd ${pkgname}-${pkgver}/eglfs_rpi
	make INSTALL_ROOT="${pkgdir}" install
}
