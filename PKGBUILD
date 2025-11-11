# Maintainer: chooisfox  <admin@redline-software.xyz>
pkgname=qt5gtk2-git
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="GTK+2.0 integration plugins for Qt5"
arch=('x86_32' 'x86_64' 'aarmv7' 'mips' 'mips64')
url="https://github.com/chooisfox/qt5gtk2.git"
license=('GPL')
groups=()
depends=('qt5-base' 'cmake' 'make' 'gtk2' 'git')
conflicts=('qt5gtk2')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/chooisfox/qt5gtk2.git#branch=master")
        
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname"
	
	mkdir build
	cd build
	cmake ..
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir" install
}
