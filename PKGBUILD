# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=crocotile3d
pkgver=2.2.6c
pkgrel=3

_install_location='/usr/share'

source=("https://jdigi.net/AUR/Crocotile3D/Crocotile3D_v${pkgver}_linux64.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")

sha256sums=('6bf3e623c640c7894f2d9c691c7bf1b826d523574d3fefc90527e2c2654ad812'
            SKIP
            SKIP)

pkgdesc='Tile-based 3D modeling application'
arch=('x86_64')
license=('Unknown')
options=(!strip)

package() {
    # Install program
    install -d "${pkgdir}${_install_location}/${pkgname}"
    cp -ar Crocotile3D_v${pkgver}_linux64/* "${pkgdir}${_install_location}/${pkgname}/"
    chmod -R 755 "${pkgdir}${_install_location}/${pkgname}"
    
    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${_install_location}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop entry
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
