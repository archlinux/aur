# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname=goatattack
pkgver=0.3.8.2
pkgrel=1
pkgdesc="A fast-paced multiplayer pixel art shooter game."
arch=("any")
url="http://www.goatattack.net/"
license=('GPL')
depends=("sdl2" "libpng" "sdl2_mixer")
source=("http://www.goatattack.net/installers/$pkgname-$pkgver.tar.gz")
md5sums=('0b6cdbc10de2e85c586d406bd5474163')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}