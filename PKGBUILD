# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=relic
pkgver=0.3.5
pkgrel=1
epoch=
pkgdesc="RELIC is an Efficient Library for Cryptography"
arch=('x86_64' 'i686')
url="https://code.google.com/p/relic-toolkit/"
license=('GPL')
makedepends=("cmake")
source=("https://relic-toolkit.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('f3dd5d7ad1683e5f4d5503b18ff18d5c')

build() {
	cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
  ctest
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
