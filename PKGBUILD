# Maintainer: SavageCore <talk@savagecore.uk>
pkgname=ronmodmanager-bin
pkgver=0.0.11
pkgrel=1
pkgdesc='Ready or Not mod manager'
arch=('x86_64')
url='https://github.com/SavageCore/RoNModManager'
license=('MIT')
depends=('fuse2' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('ronmodmanager')
conflicts=('ronmodmanager')
options=('!strip')
source_x86_64=(
    "ronmodmanager-${pkgver}.AppImage::https://github.com/SavageCore/RoNModManager/releases/download/v${pkgver}/RoN.Mod.Manager_${pkgver}_amd64.AppImage"
    "uk.savagecore.ronmodmanager.png::https://github.com/SavageCore/RoNModManager/raw/v${pkgver}/src-tauri/icons/icon.png"
    "uk.savagecore.ronmodmanager.desktop::https://github.com/SavageCore/RoNModManager/raw/v${pkgver}/packaging/aur/uk.savagecore.ronmodmanager.desktop"
)
sha256sums_x86_64=(
    'e9883159ed2a0bff273f8f634f5ee5419addaec6fde2bee77d6d0327979d12a7'
    '15b67632b3bcbed97c4b7d7bfaf9545971ad6bf10992dd49bbd73d517bd02734'
    '12acb6431b48ded8b3b29f6e7a5b30b8502883896806474506ba210b5f9743bd'
)

package() {
    install -Dm755 "${srcdir}/ronmodmanager-${pkgver}.AppImage" \
        "${pkgdir}/usr/bin/ronmodmanager"
    install -Dm644 "${srcdir}/uk.savagecore.ronmodmanager.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/uk.savagecore.ronmodmanager.png"
    install -Dm644 "${srcdir}/uk.savagecore.ronmodmanager.desktop" \
        "${pkgdir}/usr/share/applications/uk.savagecore.ronmodmanager.desktop"
}
