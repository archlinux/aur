# Maintainer: Philipp Hochmann <phil.hochmann[at]gmail[dot]com>
pkgname=ccalc
pkgver=1.5.6
pkgrel=1
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
md5sums=('c264833c12f1b1266368620bb7638ef2')
validpgpkeys=()

prepare() {
	echo "Nothing to prepare"
}

build() {
	cd "$pkgname-$pkgver"
	make
	if [ $? -eq 0 ]; then
		mv bin/release/ccalc .
	fi
}

check() {
	cd "$pkgname-$pkgver"
	if test ! -f ccalc; then
		echo "Compile error"
	else
		make tests
		make clean
	fi
}

package() {
	mkdir -p $pkgdir/usr/bin/
	mv "$pkgname-$pkgver"/ccalc $pkgdir/usr/bin
}
