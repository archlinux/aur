# Maintainer: kregonia <jiangchenglu2004@gmail.com>

pkgname=babry-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Smart boundary-aware screenshot tool for Linux Wayland"
arch=('x86_64')
url="https://github.com/kregonia/babry"
license=('Apache-2.0')
depends=('fontconfig' 'libxkbcommon' 'wayland')
provides=('babry')
conflicts=('babry')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/kregonia/babry/releases/download/v${pkgver}/babry-amd64-linux")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kregonia/babry/v${pkgver}/LICENSE"
    "babry-${pkgver}.svg::https://raw.githubusercontent.com/kregonia/babry/v${pkgver}/docs/images/babry-mark.svg"
    "babry.desktop"
)
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '83a268388cb368764310396a7faa6220a23905c2534dc1ac9a59c76e54b1e745'
            'd0886e8a423842f8b54546bbd8c5c5d642bd79d9143ce2751db34d718f9c5c85')
sha256sums_x86_64=('7a7887d7a654fc4088d44ac87e91b0599f77d85c9698b9a3fcc2f576c0d05b39')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/babry"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/babry-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/babry.svg"
    install -Dm644 "${srcdir}/babry.desktop" "${pkgdir}/usr/share/applications/babry.desktop"
}
