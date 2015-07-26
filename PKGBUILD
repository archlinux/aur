# Maintainer: Dominik Heidler <dheidler@gmail.com>
pkgname=rtl_433-git
pkgver=20150518
pkgrel=1
pkgdesc="Turns your Realtek RTL2832 based DVB dongle into a 433.92MHz generic data receiver"
arch=('i686' 'x86_64')
license=('GPL')
depends=('rtl-sdr')
makedepends=('git' 'gcc' 'cmake')
optdepends=()
provides=('rtl_433')
conflicts=('rtl_433')
url="https://github.com/merbanan/rtl_433"
source=('git://github.com/merbanan/rtl_433.git')
md5sums=('SKIP')

_gitname=rtl_433

build() {
	cd $srcdir/$_gitname
	pwd
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd $srcdir/$_gitname/build
	make DESTDIR=$pkgdir install
}
