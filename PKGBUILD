# Maintainer: Justin Kim <justin.joy.9to5@gmail.com>

pkgname=hawktracer
pkgver=0.7.0
pkgrel=2
pkgdesc='HawkTracer - a highly portable, low-overhead, configurable profiling tool'
arch=('i686' 'x86_64')
url='https://github.com/loganek/hawktracer'
license=('MIT')
makedepends=('cmake')
provides=('hawktracer')
conflicts=('hawktracer-git')
source=('https://github.com/loganek/hawktracer/archive/v0.7.0.tar.gz')
sha512sums=('24581d02d06dfa879621b487674785452ac4bc73f98b72a715b2175bf6fbd1b4ff598f5d29bdaf9e4b50aec6c1cee968000776e9f5df905e6d147827e0adcb90')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        ..

    cmake --build .
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    
    make DESTDIR="$pkgdir" install
}
