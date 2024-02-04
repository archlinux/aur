# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=4.0.0.240101
pkgrel=2
pkgdesc="A SQL client and admin tool for popular databases(SQLite/MySQL/PostgreSQL/...),support table design,query,model,sync,export/import etc,focus on comfortable,fun and developer friendly."
arch=('x86_64')
url="https://www.datatable.online"
_ghurl="https://github.com/dbkangaroo/kangaroo"
license=(
    "Apache-2.0"
    "LGPL-2.0-only"
    "LGPL-3.0-only"
    "MIT"
)
provides=("${pkgname%-max-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-max-bin}"
)
depends=(
    'gtk4'
    'json-glib'
    'hiredis'
    'hicolor-icon-theme'
    'mariadb-libs'
    'postgresql-libs'
    'unixodbc'
    'uchardet'
    'libarchive'
    'qrencode'
    'libadwaita'
    'libsoup'
)
source=(
    "${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-multiple-${pkgver}-1-${CARCH}.pkg.tar.zst"
)
sha256sums=('0c7192f688f2b9a0f85f5564a86b2465a050138d39a7435115d1753d77e778e5')
package() {
    cp -p -a "${srcdir}/usr" "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}