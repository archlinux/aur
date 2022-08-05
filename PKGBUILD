# Maintainer: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql17
pkgver=17.10.1.1
pkgrel=1
pkgdesc="Microsoft® ODBC Driver 17 for SQL Server®"
arch=('x86_64')
url="https://techcommunity.microsoft.com/t5/sql-server-blog/bg-p/SQLServer/label-name/SQLServerDrivers"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
provides=("msodbcsql=${pkgver}")
options=('!strip')
source=(https://packages.microsoft.com/rhel/8/prod/msodbcsql17-$pkgver-1.x86_64.rpm)
sha256sums=('295dfa96e8047b8a86b29f6415249aeaa7d2c96765e7539cff07f2e322e739ce')
install=msodbcsql17.install

package() {
  install -Dm0644 usr/share/doc/msodbcsql17/RELEASE_NOTES "$pkgdir"/usr/share/doc/$pkgname/RELEASE_NOTES
  install -Dm0644 usr/share/doc/msodbcsql17/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  mv opt "$pkgdir"
}
