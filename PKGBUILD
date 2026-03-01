# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

_appname=sql-studio
pkgname=${_appname}-bin
pkgver=0.1.50
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
b2sums_x86_64=('1e89ac2c7d57117e252fc6a9868557a589fbcd6b150187eabee25f636b8a444be095dcdf622ed782aa959db145b2c8f9c671d8ac437d5727af7df8d6f0ef277a'
               'd2b9f2dc31dab94d08871dacbf47290efc339624e023d25708f014ec4cf91f51c963990d5cb95df2b1dda79e96a9327284974045fcdb7a989467394714ae9a71')

package() {
    cd "${srcdir}/${_appname}-${CARCH}-unknown-linux-gnu"

    install -Dm0755 ${_appname} -t "${pkgdir}/usr/bin/"

    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
