# Maintainer: Govind K theamazingdnivog@outlook.com
pkgname=barbarian
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A frontend for the Conan package manager, written in Qt."
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('qt5-base' 'cmake')
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
source=("$pkgname-$pkgver.tar.xz")
sha256sums=('0d8349fd329233696fee62551a31960bbb69ef3edd8363ac118b528d2b0982d2')
noextract=()
validpgpkeys=()


build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake ..
	cmake --build . --target all
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/barbarian
	mkdir -p $pkgdir/usr/share/barbarian/logo
	mkdir -p $pkgdir/usr/share/barbarian/license
	install $srcdir/$pkgname-$pkgver/res/barbarian.jpeg $pkgdir/usr/share/barbarian/logo
	install $srcdir/$pkgname-$pkgver/build/Barbarian $pkgdir/usr/bin
	install $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/barbarian/license/
}
