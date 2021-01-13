# Maintainer: Frank Boerman <frank@fboerman.nl>
pkgname=libroboint-python
pkgver=0.5.5
pkgrel=1
pkgdesc="python library for the libroboint package. libroboint is an Open Source version of the fischertechnik ROBO Interface Library for Unix like systems"
arch=('x86_64' 'arm')
url="https://gitlab.com/Humpelstilzchen/libroboint"
license=('LGPLv2.1')
depends=('libroboint' 'python')
makedepends=('cmake')
source=("https://gitlab.com/Humpelstilzchen/libroboint/-/archive/$pkgver/libroboint-$pkgver.tar.gz")
md5sums=("b30d38681449840f1174573bcd310ae1")

prepare() {
    	cd "libroboint-$pkgver"
        find . -type f -exec sed -i 's/python2/python3/g' {} +
}

build() {
	cd "libroboint-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/ -DPYTHON_ROOT=$pkgdir/  .
}

package() {
	cd "libroboint-$pkgver"
	make python
}
