# Maintainer: czyt <czytcn@gmail.com>
pkgname=rexadb-bin
pkgver=1.3.16
pkgrel=1
pkgdesc="Multi-database desktop client for PostgreSQL, MySQL, MongoDB, SQLite, ClickHouse, Redis, and SQL Server"
arch=('x86_64')
url="https://www.rexadb.app"
license=('GPL-3.0')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'dbus')
provides=('rexa-db')
source=("RexaDB_${pkgver}_amd64.deb::https://github.com/RexaDB/RexaDB/releases/download/v${pkgver}/RexaDB_${pkgver}_amd64.deb")
sha256sums=('680328c34f7823b1a81effbe178a24d70072504fd0c483b9c521a781fa1fe07f')

package() {
    # Extract the deb package
    ar p "${srcdir}/RexaDB_${pkgver}_amd64.deb" data.tar.gz | tar xz -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
