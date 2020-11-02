# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='TUI Mastodon client'
pkgname=nanotodon
pkgver=0.2.0
pkgrel=2
url=https://github.com/taka-tuos/nanotodon
license=(custom:MIT)
arch=(x86_64)
depends=(ncurses json-c curl)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9cfd8c5c31bf10da53d04a89942a3500f255908369d86cb4bd2f390c211b798934f224456d2c6933dd03e1a62d16d387b26357e2b2a0e4719c0f7388d6c5c5ca')

build () {
	make -C "$pkgname-$pkgver" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin" nanotodon
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
