# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=9.5.1.531
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
sha256sums=('21d09fe3f3d49695b8a6eae4590ef66d2cd553c58e9d32150777603bf5c2d2d5'
            '9446124544ea08ddbc964a803572eb2c8ccf806823fc858726d3764981c0ad56')
package() {
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    rm -rf "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
