# Maintainer: Marat Bakeev <hawara@gmail.com>
pkgname=pg_auto_failover
pkgver=1.6.3
pkgrel=1
pkgdesc="extension and service for PostgreSQL that monitors and manages automated failover for a Postgres cluster."
arch=('x86_64')
url="https://github.com/citusdata/pg_auto_failover"
license=('custom:PostgreSQL License')
depends=('postgresql' 'ncurses' 'openssl')
makedepends=()
options=('!buildflags')
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/citusdata/pg_auto_failover/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e5880fc21728faab791a025d9434993524e190918136f856d8dbb0c064e3e75b')
# validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "$pkgname-$pkgver"
	# ./configure --prefix=/usr
	make
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
