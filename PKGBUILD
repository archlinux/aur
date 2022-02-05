# Maintainer: Stella <jens300304@gmail.com>
pkgname=libsleef
url="https://sleef.org"
pkgver=3.5.1
pkgrel=1
pkgdesc="SIMD Library for Evaluating Elementary Functions, vectorized libm and DFT"
arch=('any')
license=('Boost')
source=(
    "https://github.com/shibatch/sleef/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('415ee9b1bcc5816989d3d4d92afd0cd3f9ee89cbd5a33eb008e69751e40438ab')
depends=()
makedepends=('openmp')
checkdepends=(
    'mpfr'
    'openssl'
    'fftw'
)

build() {
    cd "$srcdir/sleef-${pkgver}"
    mkdir build && cd build 
    cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make
}

check() {
    cd "$srcdir/sleef-${pkgver}/build"
    make test
}

package() {
    cd "$srcdir/sleef-${pkgver}/build"
    make install
}

