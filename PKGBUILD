# Maintainer: Gustyx <gustiadityamuzaky08@gmail.com>
pkgname=aura-terminal-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="A modern, transparent terminal emulator built with Compose Multiplatform (Rust Backend)"
arch=('x86_64')
url="https://github.com/Gustyx-Power/AURA-Terminal"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'libxext' 'libxrender' 'libxtst' 'libxi')
provides=('aura-terminal')
conflicts=('aura-terminal')
source=("aura-terminal-source.deb::https://github.com/Gustyx-Power/AURA-Terminal/releases/download/v1.0.0/aura-terminal_1.0.0-1_amd64.deb")

sha256sums=('1087702defaaf8255fe41da8992d2e59ccbecddc6e1435e0422ac7c9ec6ffbe8')

prepare() {
    bsdtar -O -xf "aura-terminal-source.deb" data.tar.xz > "data.tar.xz"
}

package() {
    bsdtar -xf "data.tar.xz" -C "${pkgdir}"
    chmod -R 755 "${pkgdir}/opt/aura-terminal"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/aura-terminal/bin/AURA-Terminal" "${pkgdir}/usr/bin/aura-terminal"
}
