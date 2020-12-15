# Maintainer: Philipp Hochmann <phil.hochmann[at]gmail[dot]com>
pkgname=ccalc
pkgver=1.6.1
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
md5sums=('b59c5e065bbd0994832291b82f567041')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/etc/ccalc/
	mv "$pkgname-$pkgver"/bin/release/ccalc $pkgdir/usr/bin
	mv "$pkgname-$pkgver"/simplification.ruleset $pkgdir/etc/ccalc
}
