# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=ibus-array
pkgver=0.1.2
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
source=("https://github.com/lexical/ibus-array/archive/release-0.1.2.tar.gz")
noextract=()
md5sums=("ef299bd830068c886a293a7fcccff6d5")
validpgpkeys=()

prepare() {
	rm release-0.1.2.tar.gz
	mv ibus-array-release-0.1.2/* ./
	rmdir ibus-array-release-0.1.2
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

