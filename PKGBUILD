# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=freeverb3
pkgver=3.1.2
pkgrel=1
pkgdesc="a signal processing library"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/freeverb3"
license=('GPL2')
depends=('fftw')
source=("http://download-mirror.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('ff83897f258500d5b07ae6b7d6a6860c')

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
