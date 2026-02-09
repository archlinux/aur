# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=airlift-bin
_pkgname=Airlift
pkgver=1.3.1
pkgrel=1
pkgdesc="Upload & Merge Data with Attachments to Airtable.(Prebuilt version)"
arch=("x86_64")
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
    #"LICENSE-${pkgver}::https://raw.githubusercontent.com/TheAcharya/Airlift/v${pkgver}/LICENSE"
)
sha256sums=('3676cafb32cba6f9296b2a8ba9df541c37646d7e044fe2b667584ba5959ee942')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    #install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
