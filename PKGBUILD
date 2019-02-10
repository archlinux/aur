# Maintainer: osch <oliver@luced.de>

pkgluaname=mtint
pkgname=lua-$pkgluaname
pkgver=0.3.1
pkgrel=1
rockrel=1
pkgdesc="Make Lua threads and coroutines interruptible in arbitrary multi-threading scenarios."
arch=("i686" "x86_64")
url="https://github.com/osch/lua-mtint#mtint"
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

md5sums=('6a928b6d3d786305822e568198a1b7a6')
