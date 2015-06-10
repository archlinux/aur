# Maintainer: Ben Alex <ben.alex@acegi.com.au>

# See https://github.com/benalexau/libstatsd-cpp-aur for AUR PKGBUILD history

pkgname=libstatsd-cpp
pkgver=0.0.2
pkgrel=1
pkgdesc='Sends statsd metrics from C++'
arch=('x86_64')
url="https://github.com/euskadi31/statsd-cpp"
license=('MIT')
makedepends=('cmake')

source=("sdgit"::'git+http://github.com/euskadi31/statsd-cpp.git#tag=75742d2e711fa6c8af398f703a7899ac1e719f1b')
md5sums=('SKIP')

package() {
	cd ${srcdir}/sdgit
	mkdir build
        cd build
        cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
        cmake --build .
        # ctest
        cmake --build . --target install
}
