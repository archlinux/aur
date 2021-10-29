# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr
pkgver=5.3.0
pkgrel=1
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
install=$pkgname.install
depends=('postgresql-libs')
makedepends=('autoconf' 'postgresql' 'clang' 'llvm')
source=(https://repmgr.org/download/repmgr-$pkgver.tar.gz)
sha1sums=('2c233183daaf766353312d1693e394d1c1753dd9')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

