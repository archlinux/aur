# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=9.1.1.201
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
sha256sums=('91850cc6d6f3076f6699073b13dfb0bb0b5aca0de36bfcfaf36b31536adeafd1'
            '7313b500c229f2e8cbcea9371aacb3880ab9d23e3e8ae5e7ba3944492eb9aaa1')
package() {
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    rm -rf "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
