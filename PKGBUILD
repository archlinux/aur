# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=goatattack
pkgver=0.4.3
pkgrel=1
pkgdesc="A fast-paced multiplayer pixel art shooter game."
arch=("any")
url="http://www.goatattack.net/"
license=('GPL')
depends=("sdl2" "libpng" "sdl2_mixer")
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
md5sums=('4bffb9a8010cde124dbc60857dcb5ae3')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr --enable-map-editor
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}