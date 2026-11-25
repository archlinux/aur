# Maintainer: czyt <czytcn@gmail.com>
pkgname=elyterminal-bin
pkgver=0.2.7
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
sha256sums_x86_64=('eda4301a2b354f7e21c6bf1f5ee8a4c431335941f2cdb8cdab39f773b321dff5')

package() {
    local _dir="ELYTerminal-${pkgver}-linux-x86_64"

    install -Dm755 "${srcdir}/${_dir}/elyterminal" "${pkgdir}/usr/bin/elyterminal"

    install -Dm644 "${srcdir}/${_dir}/com.zacharyzhang.elyterminal.desktop" \
        "${pkgdir}/usr/share/applications/com.zacharyzhang.elyterminal.desktop"

    install -Dm644 "${srcdir}/${_dir}/com.zacharyzhang.elyterminal.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.zacharyzhang.elyterminal.svg"
}
