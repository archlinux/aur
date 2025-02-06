# Maintainer: Elijah R <elijah at elijahr dot dev>
pkgname=libcidr
pkgver=1.2.3
pkgrel=1
arch=(x86_64)
pkgdesc='libcidr is a library that provides a number of functions to input, output, manipulate, compare, multilate, and otherwise play with, IP addresses and netblocks.'
url='https://www.over-yonder.net/~fullermd/projects/libcidr'
license=(BSD-2-Clause)
source=("$url/libcidr-1.2.3.tar.xz")
sha512sums=('802b9fa6789f1f53fa46f94e4d66bf1d1aeb78cdb1696621d3df61d24ccbc2b3a4957a3b9cd3184615a4825332ae067630d2826193090a8ef6090720f2f0c2f5')

_makeopts=(
	'PREFIX=/usr'
	'CIDR_MANDIR=/usr/share/man'
	'CIDR_DOCDIR=/usr/share/doc/libcidr'
)

build() {
	cd "$pkgname-$pkgver"
	make "${_makeopts[@]}"
}

package() {
	cd "$pkgname-$pkgver"
	make "${_makeopts[@]}" DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
