# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr15
pkgver=5.4.1
pkgrel=1
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL 15 servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
install=$pkgname.install
depends=('postgresql15-libs')
makedepends=('autoconf' 'postgresql15' 'clang' 'llvm')
source=(https://repmgr.org/download/repmgr-$pkgver.tar.gz)
sha1sums=('32a0b11e3c9884a71ca393ea15f2a04d16e86629')

build() {
	export PG_CONFIG=/opt/postgresql15/bin/pg_config
	cd "repmgr-$pkgver"
	./configure
	make
}

package() {
	cd "repmgr-$pkgver"
	make DESTDIR="$pkgdir/" install
}

