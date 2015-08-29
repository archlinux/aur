# Maintainer: Andreas Baumann <abaumann@yahoo.com>

pkgname=pgfuse
pkgver=0.0.2
pkgrel=1
pkgdesc="FUSE-based file system with a PostgreSQL storage backend"
url="https://github.com/andreasbaumann/pgfuse"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('fuse' 'postgresql-libs')
makedepends=('pkg-config')
source=("https://github.com/andreasbaumann/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('89015a5c060903cff4a48752d5607e85')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=$pkgdir install
}
