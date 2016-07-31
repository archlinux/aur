# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc-bin
_pkgname=mariadb-connector-odbc
provides=('mariadb-connector-odbc')
conflicts=('mariadb-connector-odbc')
pkgver=2.0.11
pkgrel=2
pkgdesc="MariaDB Connector/ODBC is a standardized, LGPL licensed database driver using the industry standard ODBC API"
arch=('x86_64' 'i686')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc' 'libmariadbclient' 'glibc')

#Please download the binary versions from https://mariadb.com/my_portal/download/connector-odbc/2.0
#This requires registration
#Make sure you get the Ubuntu version as it links against libodbcinst.so.2 instead of libodbcinst.so.1
#If you can get this to build from source, please let me know

source=("${_pkgname}-${pkgver}-ga-linux-${arch}.tar.gz")

sha256sums=("SKIP")

package() {
    _src="$srcdir/$_pkgname-$pkgver-ga-linux-$arch"
    mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/share/doc/$_pkgname"
    install -m755 "$_src/lib/libmaodbc.so" "$pkgdir/usr/lib"
    install -m644 "$_src/share/doc/mariadb_connector_odbc/README" "$pkgdir/usr/share/doc/$_pkgname"
}
