# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=apic-bin
pkgver=0.3.2
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
sha256sums_x86_64=('d9198a46ceaf2f1f2eaadd9293a5f9c5cb046040db099721c5cce7cb0f68709f'
                   '4f3f3002e2aebc931e321362a0c60f79d59d7b83bd48a92dbe902b7d760999f1')
sha256sums_aarch64=('e09a19426e401a7cc7882503449bc7ccb11f2ce5f403fc8803dff42165ac4d96'
                    'ca3b22ac180c926ebeab548ae3ec987dab68ea097e6e4ea5aebad1489ab47d3d')

package() {
    install -Dm755 "${srcdir}/apic"     "${pkgdir}/usr/bin/apic"
    install -Dm755 "${srcdir}/apic-gui" "${pkgdir}/usr/bin/apic-gui"
    install -Dm644 "${srcdir}/apic-gui.desktop" "${pkgdir}/usr/share/applications/apic-gui.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apic-gui.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
