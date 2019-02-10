# Maintainer: osch <oliver@luced.de>

pkgluaname=mtstates
pkgname=lua-$pkgluaname
pkgver=0.4.1
pkgrel=1
rockrel=1
pkgdesc="Low-level in-memory message buffers for inter-thread communication for Lua."
arch=("i686" "x86_64")
url="https://github.com/osch/lua-mtstates#mtstates"
license=("MIT")
depends=("lua")
makedepends=("luarocks")
source=("https://github.com/osch/$pkgname/archive/v$pkgver.tar.gz")
package() {
	cd "$srcdir/$pkgname-$pkgver"
	luarocks --tree="$pkgdir/usr" make "rockspecs/$pkgluaname-$pkgver-$rockrel.rockspec"
	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$pkgluaname/$pkgver-$rockrel/doc" "$pkgdir/usr/share/doc/$pkgname"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	ln -s "../../doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -rf "$pkgdir/usr/lib/luarocks"
}

md5sums=('19f917c13d08bb5272d92c9a56ec77be')
