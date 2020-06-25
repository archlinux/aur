# Maintainer: osch <oliver@luced.de>

pkgluaname=mtmsg
pkgname=lua-$pkgluaname
pkgver=0.4.0
pkgrel=1
rockrel=1
pkgdesc="Low-level in-memory message buffers for inter-thread communication for Lua."
arch=("i686" "x86_64")
url="https://github.com/osch/lua-mtmsg#mtmsg"
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

md5sums=('c3c1c9a63c6b3a99e769ef2404efe8f7')
