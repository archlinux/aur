# Maintainer: Michael Gerhaeuser <michael dot gerhaeuser at gmail dot com>

pkgname=libusbmuxd-git
pkgver=1.0.10.r10.g8e6ce39
pkgrel=1
pkgdesc="The usbmuxd communication interface library"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('libplist-git')
makedepends=('git')
provides=('libusbmuxd')
conflicts=('libusbmuxd')

source=("git+https://git.libimobiledevice.org/libusbmuxd.git")
sha512sums=('SKIP')

pkgver() {
	cd libusbmuxd
	git describe --long --tags | sed 's/-/.r/; s/-/./'
}

build() {
	cd libusbmuxd

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd libusbmuxd
	make DESTDIR="$pkgdir" install
}
