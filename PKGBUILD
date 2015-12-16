# Maintainer: Branislav Holy <branoholy@gmail.com>
pkgname=neatoc
pkgver=1.0
pkgrel=1
pkgdesc="A simple C++ library for communication with the Neato XV robot"
arch=('i686' 'x86_64')
url="https://github.com/branoholy/neatoc"
license=('GPL3')
depends=('boost>=1.54.0')
makedepends=('cmake>=2.8.0')
source=("https://github.com/branoholy/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('cfa2ccdbfb583d0aacb1d48d91afea74')

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}
