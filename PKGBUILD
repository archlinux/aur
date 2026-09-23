# Maintainer: czyt <czytcn@gmail.com>
pkgname=rexadb-bin
pkgver=1.3.17
pkgrel=1
pkgdesc="Multi-database desktop client for PostgreSQL, MySQL, MongoDB, SQLite, ClickHouse, Redis, and SQL Server"
arch=('x86_64')
url="https://www.rexadb.app"
license=('GPL-3.0')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'dbus')
provides=('rexa-db')
source=("RexaDB_${pkgver}_amd64.deb::https://github.com/RexaDB/RexaDB/releases/download/v${pkgver}/RexaDB_${pkgver}_amd64.deb")
sha256sums=('cb9c0ece449c514ffddf9ffb69f2d1641d6342232be10817f5bbaafe9dd08b70')

package() {
    # Extract the deb package
    ar p "${srcdir}/RexaDB_${pkgver}_amd64.deb" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
