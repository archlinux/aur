# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-msodbcsql
pkgver=13.1.3.0
pkgrel=2
_srcname=msodbcsql
_prodver=${pkgver}-1
pkgdesc="Microsoft® ODBC Driver 13 for SQL Server®"
arch=('x86_64')
url="https://www.microsoft.com/en-us/download/details.aspx?id=36437"
license=('custom')
depends=('unixodbc' 'krb5')
makedepends=('libarchive')
source=("https://packages.microsoft.com/rhel/7/prod/$_srcname-$_prodver.x86_64.rpm")
sha256sums=('ab62c91da327fd6a24717061b88df1db6ff40ddf00e7c1ff53737df1d036dd5b')
install=msodbcsql.install

package() {
  cd "$pkgdir"
  bsdtar -x -f $srcdir/$_srcname-$_prodver.x86_64.rpm
  mkdir -p $pkgdir/usr/lib
  ln -s /usr/lib/libssl.so.1.0.0 $pkgdir/usr/lib/libssl.so.10
  ln -s /usr/lib/libcrypto.so.1.0.0 $pkgdir/usr/lib/libcrypto.so.10
}

