# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=postgresql-topn
pkgver=2.4.0
pkgrel=1
pkgdesc="PostgreSQL extension that returns the top values in a database according to some criteria"
arch=(x86_64)
url="https://github.com/citusdata/$pkgname"
license=('AGPL3')
depends=('postgresql')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha512sums=('b1a3e0838db2b99ba056ccc3a6318f7505c5818fa8615dc3c01fc15a9f73aedd1759c5aaf0e0a2b2e77145e41e87cfa94566e398fb7cd23758a8af7a3ba153e8')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
