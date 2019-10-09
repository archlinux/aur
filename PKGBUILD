# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>
pkgname=mssql-tools
pkgver=17.4.1.1
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
options=('!strip')
source=("https://packages.microsoft.com/rhel/7/prod/$pkgname-$pkgver-1.x86_64.rpm")
sha512sums=('6ac21455950d1570d270b7e5d0fa2522b87d6b38d5f0914d529499a3a1eb37230fb6a5c3e77c01ffded3ea5b50ded22f5164b319aeed9d1ebcd64bbe45b59215')

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
