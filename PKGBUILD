# Maintainer: Your Name <youremail@domain.com>
pkgname=NAME
pkgver=VERSION
pkgrel=1
pkgdesc=""
arch=()
# Maintainer: Thor77 <thor77 at thor77 dot org>
pkgname=goatattack
pkgver=0.3.8
pkgrel=1
pkgdesc="Goatattack is a fast-paced multiplayer pixel art shooter game."
arch=("any")
url="http://www.goatattack.net/"
license=('GPL')
depends=("sdl2_mixer")
source=("http://www.goatattack.net/installers/$pkgname-$pkgver.tar.gz")
md5sums=('7f4aea68560ded26e147d0cd7eb49e6b')

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