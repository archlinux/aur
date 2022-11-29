# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

pkgname=sqlpackage
pkgver=161.6374.0
pkgrel=1
pkgdesc="Command-line tool for creating and deploying SQL Server databases and DACPAC packages."
arch=("any")
url="https://docs.microsoft.com/en-us/sql/tools/sqlpackage-download"
license=("custom")
options=("staticlibs")
source=("sqlpackage-linux-x64-en-16.1.6374.0.zip::https://go.microsoft.com/fwlink/?linkid=2215501")
sha1sums=("9a7944ce42a7e1def9612c56586fef80c645928f")

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/$pkgname/sqlpackage" "$pkgdir/usr/bin/sqlpackage"
  install -d "$pkgdir/usr/lib"
  cp -r "$srcdir" "$pkgdir/usr/lib/$pkgname"
  chmod 755 "$pkgdir/usr/lib/$pkgname/sqlpackage"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
