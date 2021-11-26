# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

pkgname=sqlpackage
pkgver=18.8
pkgrel=1
pkgdesc="Command-line tool for creating and deploying SQL Server databases and DACPAC packages."
arch=("any")
url="https://docs.microsoft.com/en-us/sql/tools/sqlpackage-download"
license=("custom")
options=("staticlibs")
source=("sqlpackage-linux-x64-en-US-15.0.5084.2.zip::https://go.microsoft.com/fwlink/?linkid=2157202")
sha1sums=("c2328948d175af5d488b1e3f5e7b73d64915d545")

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/$pkgname/sqlpackage" "$pkgdir/usr/bin/sqlpackage"
  install -d "$pkgdir/usr/lib"
  cp -r "$srcdir" "$pkgdir/usr/lib/$pkgname"
  chmod 755 "$pkgdir/usr/lib/$pkgname/sqlpackage"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
