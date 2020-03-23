# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=relic
_pkgname=relic-toolkit
pkgver=0.5.0
pkgrel=1
pkgdesc="RELIC is an Efficient Library for Cryptography"
arch=('x86_64' 'i686')
url="https://github.com/relic-toolkit/relic"
license=('GPL')
makedepends=('cmake' 'doxygen')
source=("https://github.com/relic-toolkit/relic/archive/${_pkgname}-${pkgver}.tar.gz")
md5sums=('b552761f949c2e18a92111a395a00f79')

build() {
	cd "$srcdir/$pkgname-$_pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

check() {
	cd "$srcdir/$pkgname-$_pkgname-$pkgver"
  ctest
}

package() {
	cd "$srcdir/$pkgname-$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
