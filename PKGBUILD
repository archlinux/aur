# Maintainer: czyt <czytcn@gmail.com>
pkgname=elyterminal-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator built on GPUI"
arch=('x86_64')
url="https://github.com/ELY-Open-Source/ELYTerminal"
license=('MIT')
depends=('libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'gcc-libs' 'glibc')
provides=('elyterminal')
conflicts=('elyterminal')
options=('!strip' '!debug')
source_x86_64=("ELYTerminal-${pkgver}-linux-x86_64.tar.gz::https://github.com/ELY-Open-Source/ELYTerminal/releases/download/v${pkgver}/ELYTerminal-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('3cad4e6353f69cda5a52241ded3ffc6a0196b3498dc55fb860b2abe4cd4019a3')

package() {
    local _dir="ELYTerminal-${pkgver}-linux-x86_64"

    install -Dm755 "${srcdir}/${_dir}/elyterminal" "${pkgdir}/usr/bin/elyterminal"

    install -Dm644 "${srcdir}/${_dir}/com.zacharyzhang.elyterminal.desktop" \
        "${pkgdir}/usr/share/applications/com.zacharyzhang.elyterminal.desktop"

    install -Dm644 "${srcdir}/${_dir}/com.zacharyzhang.elyterminal.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.zacharyzhang.elyterminal.svg"
}
