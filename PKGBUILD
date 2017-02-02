# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-tools
pkgver=14.0.2.0
_prodver=${pkgver}-1
_binver=13.0.1.0
pkgrel=2
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=('mssql-msodbcsql')
makedepends=('rpmextract')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$_prodver.x86_64.rpm")
md5sums=('917195e3a429af7e4c63c3522ef8d57b')
noextract=("$pkgname-$_prodver.x86_64.rpm")

package() {
  cd "$pkgdir"
  rpmextract.sh ../../$pkgname-$_prodver.x86_64.rpm
  mkdir -p $pkgdir/usr/bin/
  chmod +x $pkgdir/opt/$pkgname/bin/sqlcmd-$_binver
  chmod +x $pkgdir/opt/$pkgname/bin/bcp-$_binver
  ln -s /opt/$pkgname/bin/sqlcmd-$pkgver $pkgdir/usr/bin/sqlcmd
  ln -s /opt/$pkgname/bin/bcp-$pkgver $pkgdir/usr/bin/bcp
}
