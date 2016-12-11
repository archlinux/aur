# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=ibus-array
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="A full function array ibus input method"
arch=('any')
url="https://github.com/lexical/ibus-array/"
license=('GPL2')
groups=()
depends=('ibus')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/lexical/ibus-array/archive/release-0.1.1.tar.gz")
noextract=()
md5sums=("16211a9b2632c060292926893280e737")
validpgpkeys=()

prepare() {
	rm release-0.1.1.tar.gz
	mv ibus-array-release-0.1.1/* ./
	rmdir ibus-array-release-0.1.1
	./autogen.sh
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

