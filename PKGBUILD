 #Maintainer: Kobus van Schoor <pbscube at gmail dot com>
pkgname=nihdb
pkgver=1.0.1
pkgrel=1
pkgdesc="An easy-to-use C++ database library"
url="http://github.com/Cube777/nihdb"
arch=('x86_64' 'i686')
source=('git+https://github.com/Cube777/nihdb.git')
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
