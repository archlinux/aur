# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=repmgr
pkgver=5.5.0
pkgrel=1
pkgdesc="repmgr is an open-source tool suite for managing replication and failover in a cluster of PostgreSQL servers."
arch=('any')
url="https://repmgr.org/"
license=('GPL')
install=$pkgname.install
depends=('postgresql-libs')
makedepends=('autoconf' 'postgresql' 'clang15' 'llvm15')
source=(https://github.com/EnterpriseDB/repmgr/releases/download/v$pkgver/repmgr-$pkgver.tar.gz)
sha1sums=('c5633c351f3a0627a53ac1828ac7581ee74c7e0c')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

