# Maintainer: Orestis Floros <orestisflo@gmail.com>
# Contributor: Doron Behar <doron.behar@gmail.com>
# Contributor: DeaDDooMER <deaddoomer@deadsoftware.ru>

pkgname=xkb-switch-git
pkgver=20171117
pkgrel=4
pkgdesc='Program that allows to query and change the XKB layout state'
arch=('i686' 'x86_64')
url='https://github.com/grwlf/xkb-switch'
license=('GPL3')
depends=('libx11' 'libxkbfile')
provides=('xkb-switch')
conflicts=('xkb-switch')
makedepends=('git' 'cmake')
source=('git+git://github.com/grwlf/xkb-switch')
sha1sums=('SKIP')

build() {
	cd xkb-switch
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd xkb-switch
	make DESTDIR="$pkgdir/" install
}
