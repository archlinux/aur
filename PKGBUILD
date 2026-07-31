# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=apic-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Git-friendly API contracts tools: CLI/TUI (apic) and desktop GUI (apic-gui), prebuilt binaries"
arch=('x86_64' 'aarch64')
url="https://github.com/rizukirr/apic"
license=('MIT')
provides=('apic' 'apic-gui')
conflicts=('apic' 'apic-gui')
depends=('hicolor-icon-theme' 'fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'libglvnd')
optdepends=('xdg-desktop-portal: file Open/New dialogs in the GUI'
            'xdg-desktop-portal-gtk: portal backend (or xdg-desktop-portal-kde on KDE)')

_rel="https://github.com/rizukirr/apic/releases/download/v${pkgver}"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/rizukirr/apic/v${pkgver}/LICENSE")
source_x86_64=("apic-${pkgver}-x86_64.tar.gz::${_rel}/apic-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
               "apic-gui-${pkgver}-x86_64.tar.gz::${_rel}/apic-gui-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("apic-${pkgver}-aarch64.tar.gz::${_rel}/apic-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
                "apic-gui-${pkgver}-aarch64.tar.gz::${_rel}/apic-gui-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('53fc69e9f347afbeca2b180cc840698a56ebdcf7e3de944557ce5c04dcba7c66')
sha256sums_x86_64=('a6a995810bced4281dc269cbe3da1e0443ddc8c4f0ff7c57dde8c6ad658b3960'
                   'eda7b490ba886f1080afae4f17248cdb3d0f65a32c1bd5573110ffa3cb0c3e87')
sha256sums_aarch64=('742f990ed1204aec0daa8cd42639155981be9fe8969e824500407e5933e75d5a'
                    'a993eee91a07cb5d57fce78afe158a171c032d3446b4be51bc12a5233361adb5')

package() {
    install -Dm755 "${srcdir}/apic"     "${pkgdir}/usr/bin/apic"
    install -Dm755 "${srcdir}/apic-gui" "${pkgdir}/usr/bin/apic-gui"
    install -Dm644 "${srcdir}/apic-gui.desktop" "${pkgdir}/usr/share/applications/apic-gui.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apic-gui.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
