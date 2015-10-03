# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname=goatattack
pkgver=0.4.2
pkgrel=1
pkgdesc="A fast-paced multiplayer pixel art shooter game."
arch=("any")
url="http://www.goatattack.net/"
license=('GPL')
depends=("sdl2" "libpng" "sdl2_mixer")
source=("http://www.goatattack.net/installers/$pkgname-$pkgver.tar.gz")
md5sums=('91337bcfce550befd5d7aac357ce6d5c')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
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