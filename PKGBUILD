 #Maintainer: Kobus van Schoor <pbscube at gmail dot com>
pkgname=dchain
pkgver=1.0.4
pkgrel=1
pkgdesc="A C++ symmetrical-key string encryption library"
url="http://github.com/Cube777/dchain"
arch=('x86_64' 'i686')
source=('git+https://github.com/Cube777/dchain.git')
md5sums=('SKIP')

prepare() {
	cd $pkgname
	git --work-tree . checkout -q tags/$pkgver
}
build() {
	cd $srcdir/$pkgname
	cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd $srcdir/$pkgname
	make DESTDIR="${pkgdir}" install
}
