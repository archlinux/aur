# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

_appname=sql-studio
pkgname=${_appname}-bin
pkgver=0.1.51
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
b2sums_x86_64=('e2e7b3b451d28859d7ba2632f156caf20d58ba9d846f2b0e30f40699b476e2dbfe48e39b7c487ee6e4179460429185acae77836c6847d5c434af03e82bfedc30'
               '619b8a69144cc43a7eb8e621b654b526582276fa89daa83fece5db2b5c6ebe1e9145dfb888e444a2aed4b8df4376bde82d7a7b86729db2883eae108d96cea0ba')

package() {
    cd "${srcdir}/${_appname}-${CARCH}-unknown-linux-gnu"

    install -Dm0755 ${_appname} -t "${pkgdir}/usr/bin/"

    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
