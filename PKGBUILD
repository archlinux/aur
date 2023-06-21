# Maintainer: Piotr Fitas <sp0tlesss@yahoo.com>
pkgname=hammer2rgb
pkgdesc="CLI tool for Modecom Volcano Hammer 2 RGB keyboard"
pkgver=1.3
pkgrel=4
epoch=
pkgdesc=""
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('libusb')
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
source=("https://github.com/sptls/hammer2rgb_linux/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        )
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
