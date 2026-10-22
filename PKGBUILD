# Maintainer: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Leo LI <i@hardrain980.com>

_upstream_pkgver=17.11.1.1-1
pkgname=msodbcsql17
pkgver=17.11.1.1
pkgrel=1
pkgdesc="Microsoft® ODBC Driver 17 for SQL Server®"
arch=('x86_64')
url="https://techcommunity.microsoft.com/t5/sql-server-blog/bg-p/SQLServer/label-name/SQLServerDrivers"
license=('custom')
depends=('unixodbc' 'krb5' 'curl')
provides=("msodbcsql=${pkgver}")
options=('!strip')
source=("https://packages.microsoft.com/rhel/10/prod/Packages/m/msodbcsql17-$_upstream_pkgver.x86_64.rpm")
sha256sums=('bc5760dbc37220d92d566e8f6006a7167e8bbc9da4cb2c3da268a8f9af1d70b9')
install=msodbcsql17.install

package() {
  install -Dm0644 usr/share/doc/msodbcsql17/RELEASE_NOTES "$pkgdir"/usr/share/doc/$pkgname/RELEASE_NOTES
  install -Dm0644 usr/share/doc/msodbcsql17/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  mv opt "$pkgdir"
}
