# Maintainer: czyt <czytcn@gmail.com>
pkgname=elyterminal-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator built on GPUI"
arch=('x86_64')
url="https://git.zacharyzhang.com/ZacharyZhang-NY/ELYTerminal"
license=('MIT')
depends=('libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'gcc-libs' 'glibc')
provides=('elyterminal')
conflicts=('elyterminal')
options=('!strip' '!debug')
source_x86_64=("ELYTerminal-${pkgver}-linux-x86_64.tar.gz::https://git.zacharyzhang.com/ZacharyZhang-NY/ELYTerminal/releases/download/v${pkgver}/ELYTerminal-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('218f65cfbcc1f9ba178ef6863c26b3ec9d4955e659e1fdbd59c31bee8e621502')

package() {
    local _dir="ELYTerminal-${pkgver}-linux-x86_64"

    install -Dm755 "${srcdir}/${_dir}/elyterminal" "${pkgdir}/usr/bin/elyterminal"

    install -Dm644 "${srcdir}/${_dir}/com.zacharyzhang.elyterminal.desktop" \
        "${pkgdir}/usr/share/applications/com.zacharyzhang.elyterminal.desktop"

    install -Dm644 "${srcdir}/${_dir}/com.zacharyzhang.elyterminal.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.zacharyzhang.elyterminal.svg"
}
