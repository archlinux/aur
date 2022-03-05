# Maintainer: osch <oliver@luced.de>
pkgname=luced
pkgver=0.02
pkgrel=1
epoch=
pkgdesc="The Lucid Editor - a fast & lightweight text editor for X11."
arch=('x86_64')
url="https://luced.de"
license=('GPL2')
groups=()
depends=('libx11'
         'libxpm'
         'xorg-fonts-75dpi')
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
source=("https://luced.de/releases/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('fe35d0c4e62ef744ee10fd189776b1ef')
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
	make DESTDIR="$pkgdir/" install-strip
}
