# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

_appname=sql-studio
pkgname=${_appname}-bin
pkgver=0.1.52
pkgrel=1
pkgdesc="SQL Database Explorer [SQLite, libSQL, PostgreSQL, MySQL/MariaDB, DuckDB, ClickHouse, Parquet and CSV]"

url="https://"${_appname}".frectonz.et"
license=('MIT')
arch=('x86_64')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'gcc-libs' 'openssl')

source_x86_64=("${pkgname}-${pkgver}.tar.xz::https://github.com/frectonz/"${_appname}"/releases/download/${pkgver}/"${_appname}"-${arch[0]}-unknown-linux-gnu.tar.xz"
               "${pkgname}-${pkgver}.tar.xz.sha256::https://github.com/frectonz/"${_appname}"/releases/download/${pkgver}/"${_appname}"-${arch[0]}-unknown-linux-gnu.tar.xz.sha256")
b2sums_x86_64=('9024aec2c33f4e44b4d4826b9eef202f5020eb2d13c7d5b66085d76fa4df1bfac2539b53dcbab9115fff5d56dd5186e48afef4e4e034d7e8bf3c40ba4b73103e'
               '43689a76bcb9bdb386486b30486bf93076e94704149f89e50c29fd46effddfa88e7fb208b6f626f740487d1f002ebf2721afa97751741b9350a42ca9aeb7d65c')

package() {
    cd "${srcdir}/${_appname}-${CARCH}-unknown-linux-gnu"

    install -Dm0755 ${_appname} -t "${pkgdir}/usr/bin/"

    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
