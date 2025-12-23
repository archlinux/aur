# Maintainer: Andreas Baumann <abaumann@yahoo.com>

pkgname=pgfuse
pkgver=0.0.2
pkgrel=3
pkgdesc="FUSE-based file system with a PostgreSQL storage backend"
url="https://www.pgfuse.org"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('fuse' 'postgresql-libs')
makedepends=('pkg-config')
source=("https://www.andreasbaumann.cc/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('19130ec8b1e96f7ce427fa269f316017')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=$pkgdir install
}
