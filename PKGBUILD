# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=pg_ivm
pkgver=1.9
pkgrel=1
pkgdesc="IVM (Incremental View Maintenance) implementation as a PostgreSQL extension "
arch=(x86_64)
url="https://github.com/sraoss/pg_ivm"
license=('custom:PostgreSQL')
groups=()
depends=(postgresql)
changelog=
source=("https://github.com/sraoss/pg_ivm/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4e2b1b0d0d2b3e35ee44f121c376432abfc8cd76aed44d9416008b4d1dc7345e0e06b8bb5cd150706b93bbb3e6fd8f46edae45cd640ae32998e319195da6ede0')

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
