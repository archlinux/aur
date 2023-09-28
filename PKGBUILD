# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=3.93.1.230928
pkgrel=1
pkgdesc="A SQL client and admin tool for popular databases(SQLite/MySQL/PostgreSQL/...),support table design,query,model,sync,export/import etc,focus on comfortable,fun and developer friendly."
arch=('x86_64')
url="https://www.datatable.online"
_githuburl="https://github.com/dbkangaroo/kangaroo"
license=("APACHE" "custom:LGPL2" "LGPL3" "MIT")
provides=("${pkgname%-max-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-max-bin}")
depends=('cairo' 'libadwaita' 'gtksourceview5' 'libgee' 'qrencode' 'libsoup' 'gtk4' 'libxml2' 'uchardet' 'json-glib' 'glibc' 'hiredis' \
    'gdk-pixbuf2' 'hicolor-icon-theme' 'openssl' 'libarchive' 'glib2' 'pango' 'libpanel' 'sqlcipher' 'mariadb-libs' 'postgresql-libs' 'unixodbc')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-multiple-${pkgver}-1-${CARCH}.pkg.tar.zst")
sha256sums=('a0ecc1102348ef5cd58ae4b58e598bc0c36bca96556f22039575b72f9e210e0f')
package() {
    cp -p -a "${srcdir}/usr" "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}