# Maintainer: yadieet <yadieet@gmail.com>

pkgname=terbilang
pkgver=1.9
pkgrel=1
pkgdesc="Number-To-Text / Number-To-Words  converter utility for Bahasa Indonesia or Indonesian Rupiah (IDR) currency."
url="https://github.com/yadieet/c-programming-examples/tree/master/terbilang"
license=('GPL3')
source=("terbilang-$pkgver.$pkgrel.c::https://raw.githubusercontent.com/yadieet/c-programming-examples/b31df7db245f79e7d4511811cd2d873771dd4857/terbilang/terbilang.c")
sha256sums=('24727528f9752d675d6f3977e5cdd3ed65ad4d03cf7f2d088be054143c2c421b')
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
