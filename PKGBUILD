# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=pg_ivm
pkgver=1.7
pkgrel=1
pkgdesc="IVM (Incremental View Maintenance) implementation as a PostgreSQL extension "
arch=(x86_64)
url="https://github.com/sraoss/pg_ivm"
license=('custom:PostgreSQL')
groups=()
depends=(postgresql)
changelog=
source=("https://github.com/sraoss/pg_ivm/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('44ffd78177d33169294fd8fac99358e0429c23fed88c3af59a4e4007a14bc38adad1985464d38006ac093ad1abd3db9e90db61d834529ae11713d56c6d206afd')

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
