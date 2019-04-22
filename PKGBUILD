# Maintainer: Evan M Jones <evanjones4040@gmail.com> 

pkgname=unicon
pkgver=latest
pkgrel=2
epoch=
pkgdesc="A modern descendant of the Icon programming language."
arch=(x86_64)
url="https://sourceforge.net/projects/unicon/"
license=('GPLv2')
groups=()
depends=()
makedepends=('subversion')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
    svn checkout https://svn.code.sf.net/p/unicon/code/trunk unicon-code
    cd unicon-code/unicon
}

build() {
    cd unicon-code/unicon
	./configure --prefix=/usr
	make -j8
}

package() {
    cd unicon-code/unicon
	make DESTDIR="$pkgdir/" install
}

