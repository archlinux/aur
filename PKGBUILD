# Maintainer: yadieet <yadieet@gmail.com>

pkgname=terbilang
pkgver=1.7
pkgrel=2
pkgdesc="Number-To-Text / Number-To-Words  converter utility for Bahasa Indonesia or Indonesian Rupiah (IDR) currency."
url="https://github.com/yadieet/c-programming-examples/tree/master/terbilang"
license=('GPL3')
source=("terbilang-$pkgver.c::https://raw.githubusercontent.com/yadieet/c-programming-examples/bc909b2d3aaba11569eb1187c009d638268ac207/terbilang/terbilang.c")
sha256sums=('6d2e5da9b3932eeba623795677c507d8911c1a76d47bb8b8aebba0abe835ddaa')
arch=('x86_64')
depends=('gmp')

build() {
	cd "$srcdir"
	gcc -Wall -Wextra -std=c11 -pedantic -o "ysa-terbilang" "terbilang-$pkgver.c" -lgmp
}

package() {
	cd "$srcdir"
  	install -D -m755 ysa-terbilang ${pkgdir}/usr/bin/ysa-terbilang
}
