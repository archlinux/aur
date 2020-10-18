# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>
pkgname=mssql-tools
pkgver=17.6.1.1
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
options=('!strip')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$pkgver-1.x86_64.rpm")
sha512sums=('e9694cb294d4a103a9824587faa426467688d12d37c73cdd135a5432b2b3624450b44071624af31775213af4c3d58d38ac8aaa4d6b29a2c3e11ade8c6331443e')

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
