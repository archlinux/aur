# Maintainer: yadieet <yadieet@gmail.com>

pkgname=terbilang
pkgver=1.7
pkgrel=1
pkgdesc="Number-To-Text / Number-To-Words  converter utility for Bahasa Indonesia or Indonesian Rupiah (IDR) currency."
url="https://github.com/yadieet/c-programming-examples/tree/master/terbilang"
license=('GPL3')
source=("terbilang-$pkgver.c::https://raw.githubusercontent.com/yadieet/c-programming-examples/5e6ffc088a44e5500dc69cce4a4ec1b1cc8e1ecb/terbilang/terbilang.c")
sha256sums=('0bce616af57b7f2aaadb71b996b0e518a2f1c345b749639f7b3537d80745b316')
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
