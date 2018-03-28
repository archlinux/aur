# Maintainer: osch <oliver@luced.de>
pkgname=luced
pkgver=0.01
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
md5sums=()
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
md5sums=('3b0a8b1480494d83f0d69e4853495712')
