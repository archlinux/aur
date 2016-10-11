# Maintainer: yadieet <yadieet@gmail.com>

pkgname=terbilang
pkgver=2.0
pkgrel=2
pkgdesc="Number-To-Text / Number-To-Words  converter utility for Bahasa Indonesia or Indonesian Rupiah (IDR) currency."
url="https://github.com/yadieet/c-programming-examples/tree/master/terbilang"
license=('GPL3')
source=("terbilang-$pkgver.$pkgrel.c::https://raw.githubusercontent.com/yadieet/c-programming-examples/c6c2b98d13bbe2b7a9216056c29fb34c54d2455c/terbilang/terbilang.c")
sha256sums=('effdbeda28e28ffaa5d7bc2fd8fda1f46965c7effc8f6fe2a3280bd9ecc4fcf9')
arch=('x86_64')
depends=('gmp')

build() {
	cd "$srcdir"
	gcc -Wall -Wextra -std=c11 -pedantic -o "ysa-terbilang" "terbilang-$pkgver.$pkgrel.c" -lgmp
}

package() {
	cd "$srcdir"
  	install -D -m755 ysa-terbilang ${pkgdir}/usr/bin/ysa-terbilang
}
