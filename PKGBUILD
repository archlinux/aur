# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=8.90.1.930
pkgrel=1
pkgdesc="A SQL client and admin tool for popular databases(SQLite/MySQL/PostgreSQL/...),support table design,query,model,sync,export/import etc,focus on comfortable,fun and developer friendly.(Prebuilt version)"
arch=('x86_64')
url="https://www.datatable.online"
_ghurl="https://github.com/dbkangaroo/kangaroo"
license=('LicenseRef-custom')
provides=("${pkgname%-max-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-max-bin}"
)
depends=(
    'gtk4'
    'json-glib'
    'hiredis'
    'mariadb-libs'
    'postgresql-libs'
    'uchardet'
    'libarchive'
    'qrencode'
    'libadwaita'
    'editorconfig-core-c'
    'unixodbc'
    'gtksourceview5'
    'libpanel'
    'libgee'
    'sqlite'
)
source=(
    "${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_ghurl}/releases/download/v${pkgver}/Kangaroo-Multiple-${pkgver}-1-${CARCH}.pkg.tar.zst"
    "LICENSE.html::${url}/en/license/service-agreement.html"
)
sha256sums=('0f132e33435b3cc34b28bb4ccddea2a143d15e94d6f03d80fab79cb0df12d5b1'
            'bc8337c6dd304bf609846fe8e0ba3cb9abc78cfd40de3091e26e7ed3c90909b7')
package() {
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    rm -rf "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
