# Maintainer: Michael Tindal ( mj.tindal @ gmail.com )

pkgname=ffxiv-teamcraft
pkgdesc="Collaborative crafting tool for Final Fantasy XIV"
pkgver=11.4.31
pkgrel=2
arch=('x86_64')
license=('MIT')
url="https://github.com/ffxiv-teamcraft/ffxiv-teamcraft"
source=(
    FFXIV-Teamcraft.AppImage::https://github.com/ffxiv-teamcraft/ffxiv-teamcraft/releases/download/v${pkgver}/FFXIV-Teamcraft.AppImage
    ffxiv-teamcraft
    FFXIV-Teamcraft.desktop
)
sha1sums=('ba6afffcf7c25ea75eb8c5a3e918ea06bd58bc6f'
          'de5f54a1a89d7a3fa22234349a64f0ce0f3d458e'
          '20530d0dcf352ebe04e9e8afe6973957a05f7a58')
install=ffxiv-teamcraft.install
options=(!strip)

package() {
    install -Dm775 "${srcdir}/ffxiv-teamcraft" "${pkgdir}/usr/bin/ffxiv-teamcraft"
    install -d -m775 "${pkgdir}/opt/ffxiv-teamcraft"
    install -Dm775 "${srcdir}/FFXIV-Teamcraft.AppImage" "${pkgdir}/opt/ffxiv-teamcraft/FFXIV-Teamcraft.AppImage"
    install -Dm644 "${srcdir}/FFXIV-Teamcraft.desktop" "${pkgdir}/usr/share/applications/FFXIV-Teamcraft.desktop"
}
