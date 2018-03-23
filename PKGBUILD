# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>

pkgname=mssql-tools
pkgver=17.0.1.1
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
options=('!strip')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$pkgver-1.x86_64.rpm")
sha512sums=('3c0e690de2e17fb39b538191b15a6e42e9214cab3ae86a35005c2d365d32b4abf9f4797f790901cff5d304fa2d5d69f8b1183d74c39389d8d81ed7d869686360')

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
