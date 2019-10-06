# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr
pkgver=4.4.0
pkgrel=2
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
depends=('postgresql-libs')
makedepends=('autoconf' 'postgresql' 'clang' 'llvm')
source=(https://repmgr.org/download/repmgr-$pkgver.tar.gz)
sha1sums=('e41a42dc5267e1b5f19d13f43a243eb7bc34d1a3')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
