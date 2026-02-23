# Maintainer: Joe Davison <joe@davison.tech>

pkgname=logserver
pkgver=1.13.6
pkgrel=1
pkgdesc="Advanced pager designed for rapid navigation of large logs."
license=('GPL-3.0-or-later')
arch=('any')
url="https://codeberg.org/potatocrunchcereal/logserver"
depends=('zlib' 'ncurses' 'catch2')
makedepends=('cmake' 'txt2man')
source=("https://codeberg.org/potatocrunchcereal/logserver/archive/v${pkgver}.tar.gz")
sha256sums=('a34b8ade224344453e7ae4afe5613fc5efd920b14ed61d8287149a2f8dfa53d1')

build() {
	cd logserver
	cmake -B build
	make -C build
}

package() {
	cd logserver

	install -d $pkgdir/usr/bin
	install -d $pkdir/usr/share/man

	install -m 755 build/logserver $pkgdir/usr/bin/logserver
	install -D -m 644 man/logserver.1.gz $pkgdir/usr/share/man/man1/logserver.1.gz

}

	
