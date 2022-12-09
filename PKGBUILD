# Maintainer: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=msodbcsql17
pkgver=17.10.2.1
pkgrel=1
pkgdesc="Microsoft® ODBC Driver 17 for SQL Server®"
arch=('x86_64')
url="https://techcommunity.microsoft.com/t5/sql-server-blog/bg-p/SQLServer/label-name/SQLServerDrivers"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
provides=("msodbcsql=${pkgver}")
options=('!strip')
source=(https://packages.microsoft.com/rhel/8/prod/msodbcsql17-$pkgver-1.x86_64.rpm)
sha256sums=('c3adf8bae5bc2f771c7d40b9805b38539294ad0b3a654bf9f3d40d93365a5f7d')
install=msodbcsql17.install

package() {
  install -Dm0644 usr/share/doc/msodbcsql17/RELEASE_NOTES "$pkgdir"/usr/share/doc/$pkgname/RELEASE_NOTES
  install -Dm0644 usr/share/doc/msodbcsql17/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  mv opt "$pkgdir"
}
