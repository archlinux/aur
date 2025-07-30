# Maintainer: MalikHw47 <help.malicorporation@gmail.com>
pkgname=gdsync-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="A GTK4 tool for syncing Geometry Dash save data between PC and Android devices(GD players who arr not always on their PC NEED this)"
arch=('x86_64')
url="https://github.com/MalikHw/gdsync"
license=('custom')
depends=('android-tools' 'gtk4' 'libadwaita')
provides=('gdsync')
conflicts=('gdsync')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/gdsync-linux"
        "${pkgname}-${pkgver}.desktop::${url}/releases/download/v${pkgver}/gdsync.desktop"
        "${pkgname}-${pkgver}.png::${url}/releases/download/v${pkgver}/icon.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/gdsync"
    
    # Install desktop file
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/gdsync.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/gdsync.png"
}
