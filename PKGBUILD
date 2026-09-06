# Maintainer: Pavle Barši <pakibarsipavle@gmail.com>

pkgname=mcmodm
pkgver=2.0
pkgrel=1
pkgdesc="Minecraft Mod Manager written in C++"
arch=('x86_64')
url="https://github.com/MidnightPavlaka635920/Minecraft-ModM"
license=('MIT')
depends=('curl' 'nlohmann-json')
makedepends=('make' 'gcc')

source=("git+https://github.com/MidnightPavlaka635920/Minecraft-ModM.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/Minecraft-ModM"
    make -j$(nproc)
}

package() {
    cd "${srcdir}/Minecraft-ModM"

    # change this if your binary has a different name
    install -Dm755 mcmodm "${pkgdir}/usr/bin/mcmodm"

    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
