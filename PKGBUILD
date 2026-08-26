# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

_appname=sql-studio
pkgname=${_appname}-bin
pkgver=0.1.53
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
b2sums_x86_64=('7536f0a9bfc0c5f11bcd579cc90933af5272e72fe355d20c3c39c362fc38be7b82bf468bd1fb2e34c0f5f6a23f817ae3be314c933ad5fbdbe88c3e3091bb0b9a'
               '97661f52bd88fc3fb01c48179fd375fe9773d6ffd8fc62e448eb8367668bed3c43fbed6f8a02b1c4f17fa2618f2bd45f5a544fbb06a9321ef2995ef1b1a6c2c0')

package() {
    cd "${srcdir}/${_appname}-${CARCH}-unknown-linux-gnu"

    install -Dm0755 ${_appname} -t "${pkgdir}/usr/bin/"

    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
