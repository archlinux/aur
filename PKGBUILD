# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr
pkgver=5.4.1
pkgrel=1
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
install=$pkgname.install
depends=('postgresql-libs')
makedepends=('autoconf' 'postgresql' 'clang15' 'llvm15')
source=(https://repmgr.org/download/repmgr-$pkgver.tar.gz)
sha1sums=('32a0b11e3c9884a71ca393ea15f2a04d16e86629')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

