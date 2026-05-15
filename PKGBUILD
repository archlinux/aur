# Maintainer: czyt <czytcn@gmail.com>
pkgname=dbx-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="Open-source, lightweight, cross-platform database client. Supports MySQL, PostgreSQL, SQLite, Redis, MongoDB, DuckDB, ClickHouse, SQL Server"
arch=('x86_64')
url="https://github.com/t8y2/dbx"
license=('MIT')
provides=('dbx')
conflicts=('dbx')
depends=('webkit2gtk-4.1' 'gtk3')
source_x86_64=("dbx_${pkgver}_amd64.deb::https://github.com/t8y2/dbx/releases/download/v${pkgver}/dbx_${pkgver}_amd64.deb")
sha256sums_x86_64=('9cce4d213f4c1829c2d8ba4c4320e4e294a3eb01e46f617311c50ad634bcc5a3')

package() {
    # Extract deb package
    ar p "${srcdir}/dbx_${pkgver}_amd64.deb" data.tar.gz | tar xz -C "${pkgdir}"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
