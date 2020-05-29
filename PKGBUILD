# Maintainer: Philipp Hochmann <phil.hochmann[ät]gmail[dot]com>
pkgname=ccalc
pkgver=1.5.2
pkgrel=0
epoch=
pkgdesc="Scientific calculator in which you can define new functions and constants"
arch=('x86_64')
url="https://github.com/PhilippHochmann/ccalc"
license=('GPL3')
groups=()
depends=('readline')
makedepends=('make' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('765a182c42169f52b09b213cef55db50')
validpgpkeys=()

prepare() {
	echo "Nothing to prepare"
}

build() {
	cd "$pkgname-$pkgver"
	make
	if [ $? -eq 0 ]; then
		mv bin/release/ccalc .
		make clean
	fi
}

check() {
	cd "$pkgname-$pkgver"
	if test ! -f ccalc; then
		echo "Compilation error"
	fi
}

package() {
	mkdir -p $pkgdir/usr/bin/
	mv "$pkgname-$pkgver"/ccalc $pkgdir/usr/bin
}
