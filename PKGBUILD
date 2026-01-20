pkgname=rset
pkgver=3.3
pkgrel=1
pkgdesc="Remote Staging Execution Tool"
url="https://github.com/eradman/rset"
license=(custom:ISC-style)
arch=(x86_64)
depends=(curl)
makedepends=(git make)
source=("git+https://github.com/eradman/rset#tag=$pkgver")
sha256sums=('d6ce727847fd1d217397707dbb5255fea0fa8814a4a74a4041471c53d0a78fd8')

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
