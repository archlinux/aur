# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr
pkgver=4.2.0
pkgrel=1
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
depends=('postgresql-libs')
makedepends=('autoconf' 'postgresql')
source=(https://repmgr.org/download/repmgr-$pkgver.tar.gz)
sha1sums=('5b1c6335474044678a89b8e4b40f5bdf37f3060c')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
