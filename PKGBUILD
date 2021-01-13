# Maintainer: Frank Boerman <frank@fboerman.nl>
pkgname=libroboint
pkgver=0.5.5
pkgrel=1
pkgdesc="libroboint is an Open Source version of the fischertechnik ROBO Interface Library for Unix like systems"
arch=('x86_64' 'arm')
url="https://gitlab.com/Humpelstilzchen/libroboint"
license=('LGPLv2.1')
depends=('libusb-compat')
makedepends=('cmake' 'gcc')
source=("https://gitlab.com/Humpelstilzchen/libroboint/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "install-location.patch")
md5sums=("b30d38681449840f1174573bcd310ae1" "655be9776e307e816e936445f00551e5")

prepare() {
    	cd "$pkgname-$pkgver"
        patch -p1 -i  "$srcdir/install-location.patch"
}

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/  .
        make
}

package() {
	cd "$pkgname-$pkgver"
	make install
}
