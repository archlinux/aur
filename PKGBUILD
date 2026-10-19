# Maintainer: czyt <czytcn@gmail.com>
pkgname=dbx-bin
pkgver=0.6.48
pkgrel=1
pkgdesc="Open-source, lightweight, cross-platform database client. Supports MySQL, PostgreSQL, SQLite, Redis, MongoDB, DuckDB, ClickHouse, SQL Server"
arch=('x86_64')
url="https://github.com/t8y2/dbx"
license=('MIT')
provides=('dbx')
conflicts=('dbx')
options=('!strip' '!debug')
depends=('webkit2gtk-4.1' 'gtk3')
source_x86_64=("dbx_${pkgver}_amd64.deb::https://github.com/t8y2/dbx/releases/download/v${pkgver}/dbx_${pkgver}_amd64.deb")
sha256sums_x86_64=('ee42a25994ed02a2228e08e1cd052f38026f947a23a0b260fa7cef8a9e24ecfb')

package() {
    # Extract deb package
    ar p "${srcdir}/dbx_${pkgver}_amd64.deb" data.tar.gz | tar xz -C "${pkgdir}"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
