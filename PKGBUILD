# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Stefan Schmidt <thrimbor dot github at gmail dot com>

pkgname=yarp
pkgver=3.3.3
pkgrel=1
pkgdesc='Yet Another Robot Platform'
arch=('x86_64' 'i686')
url="http://www.yarp.it"
license=('LGPL')
depends=('cmake' 'subversion' 'wget' 'qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-svg' 'goocanvasmm' 'tinyxml' 'gtkmm' 'ace' 'gsl' 'eigen')
makedepends=('cmake')
sha256sums=('c41056353540de983a434e8cda4e7046b06062121745d1b6149839982b199b94')
source=("https://github.com/robotology/yarp/archive/v${pkgver}.tar.gz")

build() {
	mkdir -p "$srcdir/yarp-$pkgver/build"
	cd "$srcdir/yarp-$pkgver/build"
	cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCREATE_GUIS=ON -DCREATE_LIB_MATH=ON
	make
}

package() {
	cd "$srcdir/yarp-$pkgver/build"
	make DESTDIR="${pkgdir}" install
}
