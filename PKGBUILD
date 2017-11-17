# Maintainer: Doron Behar <doron.behar@gmail.com>
# Contributer: DeaDDooMER <deaddoomer@deadsoftware.ru>

pkgname=xkb-switch-git
pkgver=20171117
pkgrel=3
pkgdesc='Program that allows to query and change the XKB layout state'
arch=('i686' 'x86_64')
url='https://github.com/ierton/xkb-switch'
license=('GPL3')
depends=('libx11')
makedepends=('git' 'cmake')
source=('git+git://github.com/ierton/xkb-switch')
sha1sums=('SKIP')

build() {
	cd xkb-switch
	cmake .
	make
}

package() {
	cd xkb-switch
	make DESTDIR="$pkgdir/" install

	mkdir "$pkgdir/usr/bin"
	ln -st "$pkgdir/usr/bin" "$pkgdir/usr/local/bin/xkb-switch"
}
