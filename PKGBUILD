# Maintainer: Bogdan Burlacu <bogdan.burlacu@pm.me> 
pkgname=aaflib
pkgver=0.1
pkgrel=1
pkgdesc="An implementation of the mathematical construct of affine arithmetics in C++."
arch=('x86_64')
url="http://aaflib.sourceforge.net"
license=('LGPL')
depends=(gcc-libs)
makedepends=(cmake)
options=('staticlibs')
source=("https://github.com/foolnotion/aaflib/archive/v$pkgver.tar.gz")
sha256sums=(5dbbf503e9c664fa90e71ce903fd165d1ab56c59ee99f50e4e088694946abf48  )

build() {
	cd "$pkgname-$pkgver"
    rm -rf build 
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    cmake --build .
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install
}
