# Maintainer: Your Name <youremail@domain.com>
pkgname=NAME
pkgver=VERSION
pkgrel=1
pkgdesc=""
arch=()
url=""
pkgname=goatattack
pkgver=0.3.8
pkgdesc="Goatattack is a fast-paced multiplayer pixel art shooter game."
url="http://www.goatattack.net/"
license=('GPL')
arch=("any")
depends=("sdl2_mixer")
source=("http://www.goatattack.net/installers/$pkgname-$pkgver.tar.gz")
md5sums=('7f4aea68560ded26e147d0cd7eb49e6b')

prepare() {
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