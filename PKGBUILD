# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=pg_ivm
pkgver=1.11
pkgrel=1
pkgdesc="IVM (Incremental View Maintenance) implementation as a PostgreSQL extension "
arch=(x86_64)
url="https://github.com/sraoss/pg_ivm"
license=('custom:PostgreSQL')
groups=()
depends=(postgresql)
changelog=
source=("https://github.com/sraoss/pg_ivm/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6ab6f89ee4ec1744e93a3a88f7622209841a71dc28a55ca738f4eaf5ec6ed7cfa6c7423538ace181ec00cda30e18786f7e021be0128df4185baf6019911564a3')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
