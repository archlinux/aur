
# Maintainer: Alex Parrill <alex.parrill@col32.net>
pkgname=asm2bf
pkgver=v1.5.4
pkgrel=1
pkgdesc="The only true brainfuck-targetting assembler"
arch=('x86_64')
url="https://github.com/kspalaiologos/asmbf"
license=('MIT')
depends=()
makedepends=()
optdepends=()
source=("$pkgname-$pkgver::https://github.com/kspalaiologos/asmbf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("e0134790bbec33e72fee7a53d925b0e7f1dee373d1ed471ffc5f6231b1ebee87")

build() {
	cd "asmbf-${pkgver:1}"
	./configure --prefix=/usr --with-target=release
	make all
}

package() {
	cd "asmbf-${pkgver:1}"
	make DESTDIR="$pkgdir/" install
}
