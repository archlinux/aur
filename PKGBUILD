# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=apic-bin
pkgver=0.3.1
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
sha256sums_x86_64=('497c1558962fae44312381dc5014ca323a882207be97756f4c5a4a6b5c38c450'
                   '9e338742541f3a8cd7f55123d7d339d147f4bd6ca75cc403796bd92debfe1ae0')
sha256sums_aarch64=('53a2b73c000f749591ff556139773e21136acfad46f5b4fe306518faa7be3a73'
                    '14ff0a21a730395ce37f2e6fd62aaa04e6ceb8637c70531ef62d64c336f10435')

package() {
    install -Dm755 "${srcdir}/apic"     "${pkgdir}/usr/bin/apic"
    install -Dm755 "${srcdir}/apic-gui" "${pkgdir}/usr/bin/apic-gui"
    install -Dm644 "${srcdir}/apic-gui.desktop" "${pkgdir}/usr/share/applications/apic-gui.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apic-gui.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
