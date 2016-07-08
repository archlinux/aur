# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=osmium-tool
pkgver=1.3.1
pkgrel=1
pkgdesc="Command line tool for working with OpenStreetMap data based on the Osmium library"
arch=('i686' 'x86_64')
depends=('boost-libs' 'expat')
makedepends=('cmake' 'libosmium')
url="http://osmcode.org/osmium/"
license=('GPL3')
source=("https://github.com/osmcode/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr
}

check() {
	cd "$pkgname-$pkgver/build"
  ctest
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}

sha1sums=('5ca1f09856273ad53b5731afbc02ed1563dc34e7')
sha256sums=('f9866b1acd85508a3c23d56d53525d46bb9ffb7836305f4058e53673acdaea7a')
