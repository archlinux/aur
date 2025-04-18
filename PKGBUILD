# Maintainer: irmluity <45vw4yz8g@mozmail.com>
# Maintainer: witt <1989161762 at qq dot com>

pkgname=wox-bin
pkgver=2.0.0_beta.2
pkgrel=1
pkgdesc="A cross-platform launcher that simply works"
arch=(x86_64)
url='https://github.com/Wox-launcher/Wox'
license=('GPL3')
options=(!strip)
depends=(
    'libayatana-appindicator'
)
provides=('wox' 'wox-launcher' 'wox-bin' 'wox-launcher-bin')
conflicts=('wox-git' 'wox-launcher-git')
source=(
    "${pkgname}-${pkgver}::https://github.com/Wox-launcher/Wox/releases/download/v${pkgver//_/-}/wox-linux-amd64"
    "license-${pkgver}::https://raw.githubusercontent.com/Wox-launcher/Wox/refs/heads/master/LICENSE"
)
sha256sums=('77aa58b392ea420b50ae7bcbcb779337752705fc61462cb518de6283494db0f2'
            '8475252f3dafb9b1a132511d368806daff74275050afcb425e743058f8a6c83c')


package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/license-${pkgver}" "${pkgdir}/opt/${pkgname%-bin}/LICENSE"
    install -d "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -s "/opt/${pkgname%-bin}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
