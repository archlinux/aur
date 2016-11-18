# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-msodbcsql
pkgver=13.0.1.0
pkgrel=1
_srcname=msodbcsql
_prodver=${pkgver}-1
pkgdesc="Microsoft® ODBC Driver 13 for SQL Server®"
arch=('x86_64')
url="https://www.microsoft.com/en-us/download/details.aspx?id=36437"
license=('custom')
depends=('unixodbc' 'krb5')
makedepends=('rpmextract')
source=("https://packages.microsoft.com/rhel/7/prod/$_srcname-$_prodver.x86_64.rpm")
sha256sums=('65f39323e6c13e8cf658f57f43d6ba0736c58f2a162397d8fd0ae0dc8926ed0b')
install=msodbcsql.install

package() {
  cd "$pkgdir"
  rpmextract.sh ../../$_srcname-$_prodver.x86_64.rpm
  mkdir -p $pkgdir/usr/lib
  ln -s /usr/lib/libssl.so.1.0.0 $pkgdir/usr/lib/libssl.so.10
  ln -s /usr/lib/libcrypto.so.1.0.0 $pkgdir/usr/lib/libcrypto.so.10
}
