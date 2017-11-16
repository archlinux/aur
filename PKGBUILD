# Maintainer: Kristof Szalay <krszalay at gmail dot com>
pkgname=adol-c
pkgver=2.6.3
pkgrel=1
epoch=
pkgdesc="ADOL-C automatic differentiation library"
arch=("x86_64")
url="https://projects.coin-or.org/ADOL-C"
license=('EPL')
groups=()
depends=()
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
source=("https://www.coin-or.org/download/source/ADOL-C/ADOL-C-$pkgver.tgz")
noextract=()
sha1sums=("d65e4d1ed3d1cd8c22f43d5c3a92477c5c0a1539")
validpgpkeys=()

build() {
	cd "ADOL-C-$pkgver"
	./configure --prefix=/usr --libdir=/usr/lib
	make
}

check() {
	cd "ADOL-C-$pkgver"
	make -k check
}

package() {
	cd "ADOL-C-$pkgver"
	make DESTDIR="$pkgdir/" install
}
