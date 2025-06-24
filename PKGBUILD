# Maintainer: MalikHw47 <help.malicorporation@gmail.com>
pkgname=gdsongextractor-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A cool-ahh tool for exporting Geometry Dash custom songs with metadata"
arch=('x86_64')
url="https://github.com/MalikHw/GDSongExtractor"
license=('MIT')
provides=('gdsongextractor')
conflicts=('gdsongextractor')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/GDSongExtractor-linux"
        "${pkgname}-${pkgver}.desktop::${url}/releases/download/v${pkgver}/gdsongextractor.desktop"
        "${pkgname}-${pkgver}.png::${url}/releases/download/v${pkgver}/icon.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/gdsongextractor"
    
    # Install desktop file
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/gdsongextractor.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/gdsongextractor.png"
}
