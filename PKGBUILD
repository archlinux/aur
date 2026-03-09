# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=airlift-bin
_pkgname=Airlift
pkgver=1.3.3
pkgrel=1
pkgdesc="Upload & Merge Data with Attachments to Airtable.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/TheAcharya/Airlift"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'zlib-ng-compat'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/bin_${pkgname%-bin}_${pkgver}_linux_x64.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/TheAcharya/Airlift/v${pkgver}/LICENSE"
)
sha256sums=('a7ffdaeb1d838f0d5a2076e976ca5a850e8704c7dd5a2899883278382af9a7bc'
            '2b7423869a2c5b9c4865f8e8890c995574f3b1e1b05714bc82038be40f93d3c6')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    #install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
