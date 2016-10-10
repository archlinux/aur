# Maintainer: yadieet <yadieet@gmail.com>

pkgname=terbilang
pkgver=1.8
pkgrel=1
pkgdesc="Number-To-Text / Number-To-Words  converter utility for Bahasa Indonesia or Indonesian Rupiah (IDR) currency."
url="https://github.com/yadieet/c-programming-examples/tree/master/terbilang"
license=('GPL3')
source=("terbilang-$pkgver.$pkgrel.c::https://raw.githubusercontent.com/yadieet/c-programming-examples/dce42e19a44b6b5c5e9226f4187a8eccb7f11980/terbilang/terbilang.c")
sha256sums=('19047e74fa457ecaae2d9dffa148f2627243cbf53de9b73cc2af6f70d7f818ad')
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
