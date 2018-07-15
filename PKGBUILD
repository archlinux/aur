# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-sqlite3
pkgver=0.1.0
pkgrel=1
pkgdesc='Guile bindings for the SQLite3 database engine'
arch=('x86_64' 'i686')
url="https://notabug.org/civodul/guile-sqlite3"
license=('LGPL3')
depends=('guile' 'sqlite3')
source=("https://notabug.org/civodul/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7501cd60bc693e581dc3e153f418279e1e1637c0760bc4524af6eb2d8eac2fe9')

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
