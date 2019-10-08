# Maintainer: Bogdan Burlacu <bogdan.burlacu@pm.me> 
pkgname=libaffa
pkgver=0.9.6
pkgrel=1
pkgdesc="A C++ affine arithmetic library for GNU/Linux."
arch=('x86_64')
url="http://savannah.nongnu.org/projects/libaffa"
license=('LGPL')
depends=(gcc-libs)
makedepends=(cmake)
options=('staticlibs')
source=("https://github.com/foolnotion/libaffa/archive/v$pkgver.tar.gz")
sha256sums=(e520282f520a07a94a6a5bb18bb5b2b6432082f72daf0c1d23b58e24120f045a)

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
