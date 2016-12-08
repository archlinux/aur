# Maintainer: zfo <zfoofz1 at gmail dot com>

pkgname=linenoise
pkgver=1.0
pkgrel=2
pkgdesc="A small self-contained alternative to readline and libedit"
arch=('i686' 'x86_64')
url="https://github.com/antirez/linenoise"
license=('BSD')
depends=()
source=("https://github.com/antirez/linenoise/archive/$pkgver.tar.gz")
md5sums=('57c163f6e53bdb5b8f935cafb714ab16')

build() {
	cd "$pkgname-$pkgver"
	cc -shared -fPIC linenoise.c -o liblinenoise.so
}

package() {
	cd "$pkgname-$pkgver"
    install -D -m644 ./linenoise.h $pkgdir/usr/include/linenoise.h
 	install -D -m644 ./liblinenoise.so $pkgdir/usr/lib/liblinenoise.so
}
