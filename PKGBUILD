# Maintainer: czyt <czytcn@gmail.com>
pkgname=dbx-bin
pkgver=0.5.38
pkgrel=1
pkgdesc="Open-source, lightweight, cross-platform database client. Supports MySQL, PostgreSQL, SQLite, Redis, MongoDB, DuckDB, ClickHouse, SQL Server"
arch=('x86_64')
url="https://github.com/t8y2/dbx"
license=('MIT')
provides=('dbx')
conflicts=('dbx')
depends=('webkit2gtk-4.1' 'gtk3')
source_x86_64=("dbx_${pkgver}_amd64.deb::https://github.com/t8y2/dbx/releases/download/v${pkgver}/dbx_${pkgver}_amd64.deb")
sha256sums_x86_64=('83e13d1eb0e65a3a092cbda3c6811f0f4b5b2a071cd69a5a677ad5f590c716f2')

package() {
    # Extract deb package
    ar p "${srcdir}/dbx_${pkgver}_amd64.deb" data.tar.gz | tar xz -C "${pkgdir}"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
