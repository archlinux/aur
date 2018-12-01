# Maintainer: Stick <nstickney@pm.me>
# shellcheck disable=2034
pkgname=bro-aux
pkgver=0.42
pkgrel=1
pkgdesc="Small auxiliary tools for Bro."
arch=(any)
url="https://www.bro.org"
license=('GPL')
source=("https://www.bro.org/downloads/$pkgname-$pkgver.tar.gz")
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
