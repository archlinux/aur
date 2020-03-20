# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('powerkit')
pkgver=1.0.0
pkgrel=6
pkgdesc='A Lightweight Desktop Independent full featured power manager'
arch=('x86_64')
url='https://github.com/rodlie/powerkit'
license=('BSD 3-Clause')
depends=('xscreensaver' 'upower')
makedepends=('xss' 'xorg-xrandr' 'qt5-base')
optdepends=('adwaita-icon-theme')
provides=('powerkit')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('e5a613f2219c0491d1bdae1fa1afe4d5')

build() {
	msg2 'Building powerkit ...'
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	qmake PREFIX="/usr" CONFIG+=install_udev_rules CONFIG+=bundle_icons ..
	make 
}

package() {
	msg2 'Installing powerkit ...'
	cd "${pkgname}-${pkgver}/build"
	make INSTALL_ROOT="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: