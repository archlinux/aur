# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr
pkgver=5.1.0
pkgrel=3
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
install=$pkgname.install
depends=('postgresql-libs')
makedepends=('autoconf' 'postgresql' 'clang' 'llvm')
source=(https://repmgr.org/download/repmgr-$pkgver.tar.gz)
sha1sums=('5859789e71f93c1315b9520e197b92fe60693418')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

