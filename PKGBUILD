# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
# Contributor: David Baer <david.a.baer@gmail.com>

pkgname=sqliteodbc
pkgver=0.9998
pkgrel=1
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
md5sums=('42262e341806a92d56c7ca769dff105c')
sha512sums=('6c36cee09a7c300dd81fd70e51e84f0e93f1178393780aae5e982e5af16af7f3abc9dd39d1bdcfa49fb2fc3db3b22331e0019eac4f383da57a21ee4d2057d71f')
