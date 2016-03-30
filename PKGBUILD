# Maintainer: Johannes "hpfmn" Wegener <mail@johanneswegener.de>
pkgname=dspatch
pkgver=3.00
pkgrel=1
epoch=
pkgdesc="A powerful C++ flow-based programming library that allows you to create and route (or \"patch\") high performance data processing circuits."
arch=("x86_64")
url="http://flowbasedprogramming.com/DSPatch/index.html"
license=('LGPL')
groups=()
depends=('glibc')
makedepends=('cmake' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://netix.dl.sourceforge.net/project/dspatch/DSPatch-$pkgver.zip")
noextract=()
md5sums=('eea62d626b1736fc983e33f717c12475')
validpgpkeys=()

prepare() {
	cd "$pkgname"
    mkdir -p build
}

build() {
	cd "$pkgname"
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles"
	make
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
