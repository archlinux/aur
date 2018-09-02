# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr
pkgver=4.1.0
pkgrel=2
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
depends=('postgresql-libs')
makedepends=('autoconf' 'postgresql')
source=(https://repmgr.org/download/repmgr-4.1.0.tar.gz)
sha1sums=('6f7e3a2605a5bb60b74b4f55baf91147a846cd5d')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
