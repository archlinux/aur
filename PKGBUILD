# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=relic
_pkgname=relic-toolkit
pkgver=0.7.0
pkgrel=1
pkgdesc="RELIC is an Efficient Library for Cryptography"
arch=('x86_64' 'i686')
url="https://github.com/relic-toolkit/relic"
license=('GPL')
makedepends=('cmake' 'doxygen')
source=("https://github.com/relic-toolkit/relic/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('ae6c60a3640fa851d6cd06e00308ad82')

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
