# Maintainer: yadieet <yadieet@gmail.com>

pkgname=terbilang
pkgver=2.0
pkgrel=3
pkgdesc="Number-To-Text / Number-To-Words  converter utility for Bahasa Indonesia or Indonesian Rupiah (IDR) currency."
url="https://github.com/yadieet/c-programming-examples/tree/master/terbilang"
license=('GPL3')
source=("terbilang-$pkgver.$pkgrel.c::https://raw.githubusercontent.com/yadieet/c-programming-examples/cd5af637c06433091c02489ce5b0470670392278/terbilang/terbilang.c")
sha256sums=('263750fdd42e0b4c6f1cc2eff2becf6b0b12cc874eb1b559135402df90c56f43')
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
