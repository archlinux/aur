# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr
pkgver=4.3.0
pkgrel=1
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
depends=('postgresql-libs')
makedepends=('autoconf' 'postgresql')
source=(https://repmgr.org/download/repmgr-$pkgver.tar.gz)
sha1sums=('8664de9e889f91450f66060d6841775893fdaabb')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
