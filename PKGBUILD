# $Id$
# Maintainer: Karuna Murti <karuna.murti@gmail.com>
pkgname=mssql-tools
pkgver=17.8.1.1
pkgrel=1
pkgdesc="Microsoft® SQL Server® Tools for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('custom')
depends=('msodbcsql')
options=('!strip')
source=("https://packages.microsoft.com/rhel/8/prod/$pkgname-$pkgver-1.x86_64.rpm")
sha512sums=('6676597c6002fc8816874443e609393b41e260f3a068f9ff485288b07c242ccc5839b0f8cb0636c711b9952c8009919176c0ffbc77d872f55bb2d6f6dfa6ca81')

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
