pkgname=rset
pkgver=3.2
pkgrel=1
pkgdesc="Remote Staging Execution Tool"
url="https://github.com/eradman/rset"
license=(custom:ISC-style)
arch=(x86_64)
makedepends=(git make)
source=("git+https://github.com/eradman/rset#tag=$pkgver")
sha256sums=('b519d2aef7e27cd5525508d5798a70f4c36e10f67796a6c8cb6a09f4b3afc00b')

build() {
	cd $pkgname
	./configure
	make PREFIX=/usr MANPREFIX=/usr/share/man
}

package() {
	cd $pkgname
	make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir" install
	install -Dm 0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
