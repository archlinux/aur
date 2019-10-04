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
sha256sums=(b85948197bbc90acb3ce768cce3997b8936f3d5fb9e2124af6fdd84fb775f03a)

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
