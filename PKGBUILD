# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passwordsafe-bin
pkgver=1.24.0
pkgrel=1
pkgdesc="Popular secure and convenient password manager(Prebuilt version)"
arch=("x86_64")
url="https://pwsafe.org/"
_ghurl="https://github.com/pwsafe/pwsafe"
license=("Artistic-2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'file'
    'curl'
    'qrencode'
    'util-linux-libs'
    'wxwidgets-gtk3'
    'wxwidgets-common'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-fedora43-${pkgver%.0}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/pwsafe/pwsafe/${pkgver}/LICENSE"
)
sha256sums=('d5311602cda8ef032eed9162ccb983e7a092a05db2484c5085924fbf8dd53dec'
            '4b78a21565152049c63fcde694cd4ba8f2205491d0e17dc4fd1a711416561013')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
