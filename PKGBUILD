# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kangaroo-max-bin
pkgver=3.92.1.230901
pkgrel=1
pkgdesc="A SQL client and admin tool for popular databases(SQLite/MySQL/PostgreSQL/...),support table design,query,model,sync,export/import etc,focus on comfortable,fun and developer friendly."
arch=('x86_64')
url="https://www.datatable.online"
_githuburl="https://github.com/dbkangaroo/kangaroo"
license=("custom")
provides=("${pkgname%-max-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-max-bin}")
depends=('cairo' 'libadwaita' 'gtksourceview5' 'libgee' 'qrencode' 'libsoup3' 'gtk4' 'libxml2' 'uchardet' 'json-glib' 'glibc' 'hiredis' \
    'gdk-pixbuf2' 'hicolor-icon-theme' 'openssl' 'libarchive' 'glib2' 'pango' 'libpanel' 'sqlcipher' 'mariadb-libs' 'postgresql-libs' 'unixodbc')
source=("${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1-${CARCH}.pkg.tar.zst"
    "LICENSE::https://raw.githubusercontent.com/dbkangaroo/kangaroo/master/LICENSE")
sha256sums=('453c33bb90bd881b3e29f8ac63c577a563265661c3d8b044b3bfd16b818359ef'
            '9b138afe817c542df709df8d28140b737a91c0bcdf58f0d120364dfd4334de45')
package() {
    cp -p -a "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}