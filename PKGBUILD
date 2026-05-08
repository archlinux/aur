# Maintainer: Joe Davison <joe@davison.tech>

pkgname=logserver
pkgver=1.13.7
pkgrel=1
pkgdesc="Advanced pager designed for rapid navigation of large logs."
license=('GPL-3.0-or-later')
arch=('any')
url="https://codeberg.org/potatocrunchcereal/logserver"
depends=('zlib' 'ncurses' 'catch2')
makedepends=('cmake' 'txt2man')
source=("https://codeberg.org/potatocrunchcereal/logserver/archive/v${pkgver}.tar.gz")
sha256sums=('bf91822658b8804c1addf9955335c05e437b906250d527df1ff32ca31e251e63')

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

	
