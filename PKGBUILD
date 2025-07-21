# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=airlift-bin
_pkgname=Airlift
pkgver=1.2.0
pkgrel=1
pkgdesc="Upload & Merge Data with Attachments to Airtable.(Prebuilt version)"
arch=("x86_64")
url="https://github.com/TheAcharya/Airlift"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/bin_${pkgname%-bin}_${pkgver}_linux_x64.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/TheAcharya/Airlift/v${pkgver}/LICENSE"
)
sha256sums=('869c41d0b53aed4adb63dc5e274efdc52bf8872b2974dfd417934963ce4ddbec'
            'b8f675195c0ecbc2d64dfb769de672582644cfe3e1406026d90e04556f4f57cf')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
