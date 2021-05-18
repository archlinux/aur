# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname=libstatsd-cpp
pkgver=1.0.0
pkgrel=1
pkgdesc='Sends statsd metrics from C++'
arch=('x86_64')
url="https://github.com/euskadi31/statsd-cpp"
license=('MIT')
makedepends=('cmake')

source=($pkgname-$pkgver::https://github.com/euskadi31/statsd-cpp/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('84bd4471367e734afe88d100fda6bb8c')

build() {
	cd statsd-cpp-$pkgver
	mkdir -p build
        cd build
        cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
        cmake --build .
}

package() {
	cd statsd-cpp-$pkgver/build
        cmake --build . --target install
}
