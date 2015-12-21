# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=ibus-array
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A full function array ibus input method"
arch=('any')
url="https://code.google.com/p/ibus-array/"
license=('GPL2')
groups=()
depends=('ibus')
makedepends=('base-devel')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://ibus-array.googlecode.com/svn/tarballs/ibus-array-0.1.0.tgz")
noextract=("ibus-array-0.1.0.tgz")
md5sums=("e4578c1b7ebf20cc19010b53b42ef20c")
validpgpkeys=()

prepare() {
	tar -zxvf ibus-array-0.1.0.tgz
	$srcdir/autogen.sh
}
build() {
	./configure --prefix=/usr \
				--without-PACKAGE \
				--libexecdir=/usr/lib/ibus
	make
}
check(){
	echo no check with this build
}
package() {
	make DESTDIR="${pkgdir}" install
}

