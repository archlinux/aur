# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='TUI Mastodon client'
pkgname=nanotodon
pkgver=0.5.0
pkgrel=1
url=https://github.com/taka-tuos/nanotodon
license=(MIT)
arch=(x86_64)
depends=(ncurses json-c curl)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('674cbdaa8ffae0dd3f1d6088e58c3ba5836d559a9fa200f512c7f1a93be0561e4c393dbb86e86c6ab3ea2347b29f83b14ae3fd7dab247eedb731a0acc44fc0e4')

build () {
	make -C "$pkgname-$pkgver" \
		LDFLAGS="$LDFLAGS" \
		CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration"
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin" nanotodon
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
