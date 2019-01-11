# Maintainer: Stick <nstickney@pm.me>
# shellcheck disable=2034
pkgname=bro-aux
pkgver=0.42
pkgrel=2
pkgdesc="Small auxiliary tools for Zeek."
arch=(any)
url="https://www.zeek.org/manual/release/components/bro-aux/README.html"
license=('BSD')
source=("https://www.zeek.org/downloads/$pkgname-$pkgver.tar.gz")
sha512sums=('f8fa31e953c1d9e4722dc7cc48c469c1bc687b53e18c2f6682b3ca95209638633ed5e499f701030546ba72fa75de32d332cd8ef42cd9bc00b754099fcb5046a5')

build() {
	cd "$pkgname-$pkgver" || exit
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver" || exit
	# shellcheck disable=2154
	make DESTDIR="$pkgdir/" install
}
