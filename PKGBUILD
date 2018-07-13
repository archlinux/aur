# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-tools
pkgver=17.2.0.1
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
options=('!strip')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$pkgver-1.x86_64.rpm")
sha512sums=('2741f67d846aef14907e69bea816650ef2a81abe498ba9807c9dd6044af5b0b0c7ac08748a9b1d3c69daa0c1b9d7284854997399901f7cd1234ef1026686a35d')

package() {
  cd "$srcdir"
  mv usr/share/{doc,licenses}
  mv usr opt "$pkgdir"

  install -dm755 "$pkgdir"/usr/bin/

  cd "$pkgdir"/opt/$pkgname/bin
  for bin in *; do
    ln -s /opt/$pkgname/bin/"$bin" "$pkgdir"/usr/bin/"$bin"
  done
}
