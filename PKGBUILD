# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=4.0.0.240101
pkgrel=1
pkgdesc="A SQL client and admin tool for popular databases(SQLite/MySQL/PostgreSQL/...),support table design,query,model,sync,export/import etc,focus on comfortable,fun and developer friendly."
arch=('x86_64')
url="https://www.datatable.online"
_ghurl="https://github.com/dbkangaroo/kangaroo"
license=(
    "APACHE"
    "custom:LGPL2"
    "LGPL3"
    "MIT"
)
provides=("${pkgname%-max-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-max-bin}")
depends=(
    'cairo'
    'libadwaita'
    'gtksourceview5'
    'libgee'
    'qrencode'
    'libsoup'
    'gtk4'
    'libxml2'
    'uchardet'
    'json-glib'
    'hiredis'
    'gdk-pixbuf2'
    'hicolor-icon-theme'
    'openssl'
    'libarchive'
    'pango'
    'libpanel'
    'mariadb-libs'
    'postgresql-libs'
    'unixodbc'
)
source=(
    "${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-multiple-${pkgver}-1-${CARCH}.pkg.tar.zst"
)
sha256sums=('0c7192f688f2b9a0f85f5564a86b2465a050138d39a7435115d1753d77e778e5')
package() {
    cp -p -a "${srcdir}/usr" "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}