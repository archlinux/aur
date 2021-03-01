# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-sqlite3
pkgver=0.1.3
pkgrel=1
pkgdesc='Guile bindings for the SQLite3 database engine'
arch=('x86_64' 'i686' 'armv7h')
url="https://notabug.org/guile-sqlite3/guile-sqlite3"
license=('LGPL3')
depends=('guile' 'sqlite3')
source=("${pkgname}-${pkgver}.tar.gz::https://notabug.org/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('158cb82958c6329319f911412999ea125980f327f54185bf0dad271d6f8f45c2')

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
