# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Maintainer: McNoggins <gagnon88@gmail.com>
pkgname=complex_bessel
pkgver=0.6
pkgrel=1
pkgdesc="A C++ library to evaluate the Bessel functions of real order and complex argument."
arch=('any')
url="https://github.com/valandil/complex_bessel"
license=('LGPL')
makedepends=('cmake' 'gcc' 'gcc-fortran')
source=(https://github.com/valandil/complex_bessel/archive/release-${pkgver}.tar.gz)
sha256sums=('38abe0b08a26d0b6a447db0e2e352d24b180dcec236f5d0629a1e5b91e8b704f')

build() {
    cd "$srcdir/$pkgname-release-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ .
    make
}

package() {
    cd "$srcdir/$pkgname-release-$pkgver"
    make install
}
