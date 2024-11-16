# Maintainer: João Pedro Oliveira <oliveira.joao@unifesp.br>

pkgname='wiredpanda'
pkgver=4.1.12
pkgrel=1
pkgdesc="Software developed in order to help students learn about logic circuits."
arch=('x86_64')
url="https://gibis-unifesp.github.io/wiredpanda-site/"
license=('GPL-3.0-or-later')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('git' 'make')
backup=('etc/pacman.conf')
source=("$pkgname::git+https://github.com/GIBIS-UNIFESP/wiRedPanda.git")
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname"
	mkdir -p build
	cd build
	qmake ../WPanda.pro
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make
	install -Dm755 "$srcdir/$pkgname/build/app/wiredpanda" "$pkgdir/usr/bin/wiredpanda"
}
