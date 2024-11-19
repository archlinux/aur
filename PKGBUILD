# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-bin
_pkgver=19.10.2024
pkgver="${_pkgver}+alpha"
pkgrel=1
pkgdesc='Free pixelart editor made in SDL2 C++'
url='https://github.com/counter185/voidsprite'
_zip=voidsprite-${_pkgver}-linux-x86_64.zip
source=("https://github.com/counter185/voidsprite/releases/download/alpha${_pkgver}/${_zip}"
        'voidsprite')
arch=('x86_64')
conflicts=('voidsprite')
provides=("voidsprite=${_pkgver}")
sha256sums=('d7e3a6184a8ef7bb02f45521988369895547fa1f279fd116073db1e4887df3d9'
            '230652d0b71431c0daf1040fcaff57b402ab62ce55cb5fd1eac90011769f88da')
depends=(sdl2 sdl2_image sdl2_ttf libpng pugixml xdg-utils)
makedepends=(unzip)
license=(GPL-2.0-only)

package() {
    mkdir -p v
    unzip -d v "${srcdir}/${_zip}"

    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/opt/voidsprite"
    mv v/share "${pkgdir}/usr"
    mv v/bin/* "${pkgdir}/opt/voidsprite/"
    mv v/OPEN_SOURCE_LICENSES "${pkgdir}/opt/voidsprite/"
    
    install -m755 "${srcdir}/voidsprite" "${pkgdir}/usr/bin/"

    rm -fr v
}

