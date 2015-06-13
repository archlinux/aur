# Maintainer: Brendan MacDonell <brendan@macdonell.net>
pkgname=mongo_fdw
pkgver=3.0
pkgrel=1
pkgdesc="PostgreSQL foreign data wrapper for MongoDB"
arch=('i686' 'x86_64')
url="https://github.com/citusdata/mongo_fdw"
license=('LGPL3')
depends=(postgresql)
install=mongo_fdw.install
source=("https://github.com/citusdata/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c2b9267c21199852ddd1989d447fd413')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
