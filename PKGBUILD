# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=apic-bin
pkgver=0.5.0
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
sha256sums_x86_64=('32a5c54d08f2a7d0d826d63c9aa1ce59e2ac7ac6e34d91f121a0d3e0278575a4'
                   '55e33ccba9413e381843d327a5ddcdaeab4f7b39fe26daaf481c52e6647197fb')
sha256sums_aarch64=('6ec8d15064f9d11fb4c66bd1733b195d9431193ecd5e5f0f77e9bca0be922b0f'
                    'eb33b96530db8aaa18fbc35b47b5000ac5ac8dfb40bcdbeb00c2be00f3cd266b')

package() {
    install -Dm755 "${srcdir}/apic"     "${pkgdir}/usr/bin/apic"
    install -Dm755 "${srcdir}/apic-gui" "${pkgdir}/usr/bin/apic-gui"
    install -Dm644 "${srcdir}/apic-gui.desktop" "${pkgdir}/usr/share/applications/apic-gui.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apic-gui.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
