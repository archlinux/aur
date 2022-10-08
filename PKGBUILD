# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andrew Kallmeyer <fsmv@sapium.net>
pkgname=libcurlpp
pkgver="0.8.1"
pkgrel=2
pkgdesc="cURLpp is a C++ wrapper for libcURL."
arch=('i686' 'x86_64' 'aarch64')
url="http://curlpp.org"
license=('MIT')
depends=('curl>=7.10.0')
makedepends=('cmake>=2.8.12')
source=("https://github.com/jpbarrette/curlpp/archive/v${pkgver}.tar.gz")
md5sums=("2fdd2fc2e577b7e76193018cac457e9c")

prepare() {
	cd "curlpp-$pkgver"
}

build() {
	cd "curlpp-$pkgver"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib' ..
	make
}

package() {
	cd "curlpp-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
