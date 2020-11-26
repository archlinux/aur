# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

pkgname=sqlpackage
pkgver=18.6
pkgrel=1
pkgdesc="Command-line tool for creating and deploying SQL Server databases and DACPAC packages."
arch=("any")
url="https://docs.microsoft.com/en-us/sql/tools/sqlpackage-download"
license=("custom")
options=("staticlibs")
source=("sqlpackage-linux-x64-en-US-15.0.4897.1.zip::https://go.microsoft.com/fwlink/?linkid=2143497")
sha1sums=("33016a6310cff9f7cf6421d257faace64815c14f")

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/$pkgname/sqlpackage" "$pkgdir/usr/bin/sqlpackage"
  install -d "$pkgdir/usr/lib"
  cp -r "$srcdir" "$pkgdir/usr/lib/$pkgname"
  chmod 755 "$pkgdir/usr/lib/$pkgname/sqlpackage"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

