# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=kangaroo
pkgname="${_pkgname}-max-bin"
pkgver=5.1.0.240701
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
    'unixodbc'
)
source=(
    "${pkgname%-bin}-${pkgver}.pkg.tar.zst::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-multiple-${pkgver}-1-${CARCH}.pkg.tar.zst"
    "LICENSE.html::${url}/en/license/service-agreement.html"
)
sha256sums=('669bea9d1807dac67cdec7c56b41e2e35d42e809fb38ee3d893edcab1c44458d'
            '6b1cd9d2720d4d0ad22b5e42019e7596221e37b849a1c10baf5d5af16327b2f9')
package() {
    cp -p -a "${srcdir}/usr" "${pkgdir}"
    rm -rf "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}