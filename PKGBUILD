# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=4.99.9.240430
pkgrel=1
pkgdesc="A SQL client and admin tool for popular databases(SQLite/MySQL/PostgreSQL/...),support table design,query,model,sync,export/import etc,focus on comfortable,fun and developer friendly."
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
    'libsoup'
    'editorconfig-core-c'
)
source=(
    "${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-multiple-${pkgver}-1-${CARCH}.pkg.tar.zst"
    "LICENSE.html::${url}/en/license/service-agreement.html"
)
sha256sums=('d79f2931172807d0eafc11288b8e4bd9b80f4ca55a5ac1de6ad86c64625b7af7'
            '8aa79fdfc5782ab83b05295b596f579be81c927dd6df9bc758a6a923db232db0')
package() {
    cp -p -a "${srcdir}/usr" "${pkgdir}"
    rm -rf "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}