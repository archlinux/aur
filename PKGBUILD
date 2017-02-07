# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-tools
pkgver=14.0.3.0
_prodver=${pkgver}-1
_binver=13.0.1.0
pkgrel=3
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=('msodbcsql')
makedepends=('libarchive')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$_prodver.x86_64.rpm")
md5sums=('bf0cfb7f21c197d098b43ed1f510afcd')
noextract=("$pkgname-$_prodver.x86_64.rpm")

package() {
  cd "$pkgdir"
  bsdtar -x -f $srcdir/$pkgname-$_prodver.x86_64.rpm
  mkdir -p $pkgdir/usr/bin/
  chmod +x $pkgdir/opt/$pkgname/bin/sqlcmd
  chmod +x $pkgdir/opt/$pkgname/bin/bcp
  ln -s /opt/$pkgname/bin/sqlcmd-$pkgver $pkgdir/usr/bin/sqlcmd
  ln -s /opt/$pkgname/bin/bcp-$pkgver $pkgdir/usr/bin/bcp
}
