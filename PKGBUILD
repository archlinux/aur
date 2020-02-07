# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

pkgname=sqlpackage
pkgver=18.4.1
pkgrel=1
pkgdesc="Command-line tool for creating and deploying SQL Server databases and DACPAC packages."
arch=("any")
url="https://docs.microsoft.com/en-us/sql/tools/sqlpackage-download"
license=("custom")
options=("staticlibs")
source=("sqlpackage-linux-x64-en-US-15.0.4630.1.zip::https://go.microsoft.com/fwlink/?linkid=2113331")
sha1sums=("b11f0e0122c6c43bc5481a1d2597762d588463f2")

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/$pkgname/sqlpackage" "$pkgdir/usr/bin/sqlpackage"
  install -d "$pkgdir/usr/lib"
  cp -r "$srcdir" "$pkgdir/usr/lib/$pkgname"
  chmod 755 "$pkgdir/usr/lib/$pkgname/sqlpackage"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

