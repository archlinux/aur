# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=3.99.1.231105
pkgrel=1
pkgdesc="A SQL client and admin tool for popular databases(SQLite/MySQL/PostgreSQL/...),support table design,query,model,sync,export/import etc,focus on comfortable,fun and developer friendly."
arch=('x86_64')
url="https://www.datatable.online"
_githuburl="https://github.com/dbkangaroo/kangaroo"
license=("APACHE" "custom:LGPL2" "LGPL3" "MIT")
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
    'sqlcipher'
    'mariadb-libs'
    'postgresql-libs'
    'unixodbc'
)
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-multiple-${pkgver}-1-${CARCH}.pkg.tar.zst")
sha256sums=('2758ce257bda8ce6fa9e739e85ea5c47bf6da3894947254d90c732188d4fd37b')
package() {
    cp -p -a "${srcdir}/usr" "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}