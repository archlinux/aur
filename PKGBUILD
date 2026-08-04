pkgname=rset
pkgver=3.4
pkgrel=1
pkgdesc="Remote Staging Execution Tool"
url="https://github.com/eradman/rset"
license=(custom:ISC-style)
arch=(x86_64)
depends=(curl)
makedepends=(git make)
source=("git+https://github.com/eradman/rset#tag=$pkgver")
sha256sums=('bdedc83d6f5699db0a69bd8f806532a96bded08050ba636daf9f919bc520a486')

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
