# Contributor: strata <strata@dropswitch.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: osch <oliver@luced.de>
pkgname=lrexlib-pcre2
pkgver=2.9.0
pkgrel=2
rockrel=1
pkgdesc="Regular expression library for Lua - PCRE2 version"
arch=('i686' 'x86_64')
url="https://luarocks.org/modules/rrt/$pkgname"
license=('custom')
depends=('lua' 'pcre2')
makedepends=('luarocks')
source=(
	"https://luarocks.org/$pkgname-$pkgver-$rockrel.src.rock"
)
noextract=(
	"$pkgname-$pkgver-$rockrel.src.rock"
)

package() {
	luarocks --tree="$pkgdir/usr" install "$pkgname-$pkgver-$rockrel.src.rock"

	mkdir -p "$pkgdir/usr/share/doc"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/lib/luarocks/rocks-"*"/$pkgname/$pkgver-$rockrel/doc" "$pkgdir/usr/share/doc/$pkgname"
	chmod -R 0644 "$pkgdir/usr/share/doc/$pkgname"/*
	rm -f "$pkgdir/usr/share/doc/$pkgname/.gitignore"
	ln -s "../../doc/$pkgname/license.html" "$pkgdir/usr/share/licenses/$pkgname/license.html"
	rm -rf "$pkgdir/usr/lib/luarocks"
}

md5sums=('336121adc7723803315d5bbdd312a1bb')
