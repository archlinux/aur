# Maintainer: Oliver Giles <web ohwg net>
pkgname=laminar
pkgver=0.5
pkgrel=1
pkgdesc="Fast and lightweight Continuous Integration server"
arch=('i686' 'x86_64')
url="http://laminar.ohwg.net"
license=('GPL3')
groups=()
depends=('capnproto-git' 'sqlite' 'boost-libs')
makedepends=('cmake' 'boost' 'rapidjson' 'websocketpp')
options=('strip')
source=("https://github.com/ohwgiles/laminar/archive/$pkgver.tar.gz")
install=laminar.install
md5sums=('441d81f6000ab6354bf253aa860c6c2c')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/ -DCMAKE_BUILD_TYPE=Release .
	make -j4
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

