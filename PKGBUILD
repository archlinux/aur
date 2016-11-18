# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-tools
pkgver=14.0.1.246
_prodver=${pkgver}-1
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=('mssql-msodbcsql')
makedepends=('rpmextract')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$_prodver.x86_64.rpm")
md5sums=('7166ec85f1f2a753d9caa528eb940dff')
noextract=("$pkgname-$_prodver.x86_64.rpm")

package() {
  cd "$pkgdir"
  rpmextract.sh ../../$pkgname-$_prodver.x86_64.rpm
  mkdir -p $pkgdir/usr/bin/
  chmod +x $pkgdir/opt/$pkgname/bin/sqlcmd-$pkgver
  chmod +x $pkgdir/opt/$pkgname/bin/bcp-$pkgver
  ln -s $pkgdir/opt/$pkgname/bin/sqlcmd-$pkgver $pkgdir/usr/bin/sqlcmd
  ln -s $pkgdir/opt/$pkgname/bin/bcp-$pkgver $pkgdir/usr/bin/bcp
}
