# Maintainer: czyt <czytcn@gmail.com>
pkgname=elyterminal-bin
pkgver=0.1.4
pkgrel=2
pkgdesc="A GPU-accelerated terminal emulator built on GPUI"
arch=('x86_64')
url="https://git.zacharyzhang.com/ZacharyZhang-NY/ELYTerminal"
license=('MIT')
depends=('libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'gcc-libs' 'glibc')
provides=('elyterminal')
conflicts=('elyterminal')
options=('!strip' '!debug')
source_x86_64=("ELYTerminal-${pkgver}-linux-x86_64.tar.gz::https://git.zacharyzhang.com/ZacharyZhang-NY/ELYTerminal/releases/download/v${pkgver}/ELYTerminal-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('ff737bcebb12bc5fb4bb94f2001cb9d3c78bce220c6d9a3c3f3dfc65080fb24f')

package() {
    local _dir="ELYTerminal-${pkgver}-linux-x86_64"

    install -Dm755 "${srcdir}/${_dir}/elyterminal" "${pkgdir}/usr/bin/elyterminal"

    install -Dm644 "${srcdir}/${_dir}/com.zacharyzhang.elyterminal.desktop" \
        "${pkgdir}/usr/share/applications/com.zacharyzhang.elyterminal.desktop"

    install -Dm644 "${srcdir}/${_dir}/com.zacharyzhang.elyterminal.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.zacharyzhang.elyterminal.svg"
}
