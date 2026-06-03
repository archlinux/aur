# Maintainer: SavageCore <talk@savagecore.uk>
pkgname=ronmodmanager-bin
pkgver=0.0.9
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
    'APPIMAGE_SHA256'
    'ICON_SHA256'
    'DESKTOP_SHA256'
)

package() {
    install -Dm755 "${srcdir}/ronmodmanager-${pkgver}.AppImage" \
        "${pkgdir}/usr/bin/ronmodmanager"
    install -Dm644 "${srcdir}/uk.savagecore.ronmodmanager.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/uk.savagecore.ronmodmanager.png"
    install -Dm644 "${srcdir}/uk.savagecore.ronmodmanager.desktop" \
        "${pkgdir}/usr/share/applications/uk.savagecore.ronmodmanager.desktop"
}
