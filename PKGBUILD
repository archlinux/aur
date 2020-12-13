# Maintainer: Philipp Hochmann <phil.hochmann[at]gmail[dot]com>
pkgname=ccalc
pkgver=1.6.0
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
md5sums=('bdd864570dea7ad2604045837cf3e8a3')
validpgpkeys=()

prepare() {
	echo "Nothing to prepare"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	if test ! -f bin/release/ccalc; then
		echo "Compile error"
	fi
}

package() {
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/etc/ccalc/
	mv "$pkgname-$pkgver"/bin/release/ccalc $pkgdir/usr/bin
	mv "$pkgname-$pkgver"/simplification.ruleset $pkgdir/etc/ccalc
}
