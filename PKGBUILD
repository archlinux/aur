# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
# Contributor: David Baer <david.a.baer@gmail.com>

pkgname=sqliteodbc
pkgver=0.9996
pkgrel=2
pkgdesc="ODBC driver for SQLite"
arch=('i686' 'x86_64')
depends=('unixodbc' 'sqlite' 'libxml2')
url="http://www.ch-werner.de/sqliteodbc/"
license=('BSD')
source=(http://www.ch-werner.de/sqliteodbc/${pkgname}-${pkgver}.tar.gz)
install=sqliteodbc.install

build() {
    cd "$srcdir/${pkgname}-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make -j1
}

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    install -d "${pkgdir}/usr/lib"
    make -j1 DESTDIR="${pkgdir}/" install
    install -D -m644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('703e298a7232e49be1ddf26769c71211')
sha512sums=('d50ee33f60f2dacede2c72443b4540cd6fc267c132ddb9933d9df8ccb5c6dcc8c81b42a3d2c024ebed293482b15399f504a84ef3dc28f1f229348e6f8ea6aa64')
