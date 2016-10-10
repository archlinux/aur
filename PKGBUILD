# Maintainer: yadieet <yadieet@gmail.com>

pkgname=terbilang
pkgver=1.7
pkgrel=5
pkgdesc="Number-To-Text / Number-To-Words  converter utility for Bahasa Indonesia or Indonesian Rupiah (IDR) currency."
url="https://github.com/yadieet/c-programming-examples/tree/master/terbilang"
license=('GPL3')
source=("terbilang-$pkgver.$pkgrel.c::https://raw.githubusercontent.com/yadieet/c-programming-examples/be7dfbb72dacaaa11344d262b1bb6c45a2235700/terbilang/terbilang.c")
sha256sums=('f8b558001738227e98a58b5a6a42f9ac623a10572393ece0de82309288c86ae8')
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
