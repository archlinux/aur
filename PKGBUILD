# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=intel-lpmd
pkgver=0.0.3
pkgrel=1
pkgdesc="Intel Low Power Mode Daemon"
arch=('x86_64')
url="https://github.com/intel/$pkgname"
license=('GPL-2.0-or-later')
makedepends=('git' 'automake' 'autoconf-archive' 'gtk-doc')
depends=('dbus-glib' 'libxml2' 'libnl' 'systemd-libs')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	./autogen.sh prefix=/usr sysconfdir=/etc sbindir=/usr/bin
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" make install
}
