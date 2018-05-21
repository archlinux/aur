# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=freeverb3
pkgver=3.2.1
pkgrel=1
pkgdesc="a signal processing library"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/freeverb3"
license=('GPL2')
depends=('fftw')
source=("http://download-mirror.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('8f57e0758024696cdfc0f5e75a2752de')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
