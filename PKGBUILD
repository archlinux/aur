# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=crocotile3d
pkgver=2.2.8
pkgrel=1

_install_location='/usr/share'

source=("https://jdigi.net/AUR/Crocotile3D/Crocotile3D_v${pkgver}_linux64.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png")

sha256sums=('a0d20b5832e1fedf7f91ba4ea25eefc2d7fa63694c5ba792a38a1beb6a19a25c'
            SKIP
            SKIP)

pkgdesc='Tile-based 3D modeling application'
arch=('x86_64')
url="https://www.crocotile3d.com/"
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
