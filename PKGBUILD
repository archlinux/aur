# Maintainer: czyt <czytcn@gmail.com>
pkgname=rexadb-bin
pkgver=1.3.29
pkgrel=1
pkgdesc="Multi-database desktop client for PostgreSQL, MySQL, MongoDB, SQLite, ClickHouse, Redis, and SQL Server"
arch=('x86_64')
url="https://www.rexadb.app"
license=('GPL-3.0')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'dbus')
provides=('rexa-db')
source=("RexaDB_${pkgver}_amd64.deb::https://github.com/RexaDB/RexaDB/releases/download/v${pkgver}/RexaDB_${pkgver}_amd64.deb")
sha256sums=('9391208b06c66a0be94a09d003fc752040272723e80cde3b18b3eddd53daf0d4')

package() {
    # Extract the deb package
    ar p "${srcdir}/RexaDB_${pkgver}_amd64.deb" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
