# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=3.99.2.231201
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
sha256sums=('42b961b15a5568ad29916b41ef6f91cfbc1b628fc3f142928d9c3f4739d55e10'
            '9b138afe817c542df709df8d28140b737a91c0bcdf58f0d120364dfd4334de45')
package() {
    cp -p -a "${srcdir}/usr" "${pkgdir}"
    mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}