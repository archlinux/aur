# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Maintainer: McNoggins <gagnon88@gmail.com>
pkgname=complex_bessel
pkgver=0.7.0_beta
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A C++ library to evaluate the Bessel functions of real order and complex argument."
arch=('any')
url="https://github.com/valandil/complex_bessel"
license=('LGPL')
makedepends=('cmake' 'gcc' 'gcc-fortran')
source=(https://github.com/valandil/complex_bessel/archive/v${_pkgver}.tar.gz)
sha256sums=('9ae999d7c3c9da633c24f5eb8b593376a5e7d777e941b203309c0b0ab48509cd')

build() {
    cd "$srcdir/$pkgname-$_pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ .
    make
}

package() {
    cd "$srcdir/$pkgname-$_pkgver"
    make install
}
