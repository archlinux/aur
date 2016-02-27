 #Maintainer: Kobus van Schoor <pbscube at gmail dot com>
pkgname=bassoon
pkgver=1.0.5
pkgrel=1
pkgdesc="An easy to use CLI password manager utilizing the dchain encryption library"
url="http://github.com/Cube777/bassoon"
arch=('x86_64' 'i686')
source=('git+https://github.com/Cube777/bassoon.git')
depends=('dchain' 'nihdb')
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
