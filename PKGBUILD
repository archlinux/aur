# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=postgresql-topn
pkgver=2.5.0
pkgrel=1
pkgdesc="PostgreSQL extension that returns the top values in a database according to some criteria"
arch=(x86_64)
url="https://github.com/citusdata/$pkgname"
license=('AGPL3')
depends=('postgresql')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha512sums=('a190b89005ac4264f39efcb3deaed670722686d3800313615a8952770db4783fd43c58ccf6af7b6df142436d26625fa43512b37df56588e8c405df670244bdb9')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
