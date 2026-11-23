# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=apic-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Git-friendly API contracts tools: CLI (apic) and desktop GUI (apic-gui), prebuilt binaries"
arch=('x86_64' 'aarch64')
url="https://github.com/rizukirr/apic"
license=('GPL-3.0-only')
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
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('344e93cb58daef1343207a969f5d30059ff0c1b8456322d8995ca3d054f2229b'
                   '1be9c99e44627a97e5e09108473583b6d84ac7c6a8554f2b5984c20852c52ecb')
sha256sums_aarch64=('6afdd19dd51f692bdbb8c38203db6a200a5b7e5114a865fd02121bcbe0f1bf0e'
                    'a7c176d9c4817f4098fa0ad7ee317ea0b87a15b29e13eaef3a6b26597c64f505')

package() {
    install -Dm755 "${srcdir}/apic"     "${pkgdir}/usr/bin/apic"
    install -Dm755 "${srcdir}/apic-gui" "${pkgdir}/usr/bin/apic-gui"
    install -Dm644 "${srcdir}/apic-gui.desktop" "${pkgdir}/usr/share/applications/apic-gui.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apic-gui.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
