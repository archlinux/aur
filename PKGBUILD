# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=roswell
pkgver="0.0.3.47"
pkgrel=1
pkgdesc="Lisp installer and launcher"
url="https://github.com/snmsts/roswell"
arch=('i686' 'x86_64')
license=('MIT')
optdepends=()
source=("https://github.com/snmsts/roswell/archive/v$pkgver.tar.gz")
md5sums=('9878b4774351edbcd8f7ffeea55888c1')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
