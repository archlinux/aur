# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=airlift-bin
_pkgname=Airlift
pkgver=1.1.4
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
sha256sums=('038e4328013de72af59407accbf8f7164a0b5f71276bf871228ce584876450d8'
            '67067a59e0c9762bb67f448315f48a9d759a47544280ac323f6f02f741459fa2')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}