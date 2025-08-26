# Maintainer: Marie Piontek <marie@kaifa.ch>
# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>

pkgname=tidal-hifi-bin
pkgver=5.20.1
pkgrel=3
pkgdesc="The web version of Tidal running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
conflicts=("tidal-hifi")
provides=("tidal-hifi")
source=("tidal-hifi-${pkgver}.tar.gz::https://github.com/Mastermindzh/tidal-hifi/releases/download/${pkgver}/tidal-hifi-${pkgver}.tar.gz"
        "tidal-hifi.desktop"
        "icon.png")
sha256sums=('2ba5270166cdcefd903d6313f94aee0eea54cb64e6fda46d8b3bb5af11519668'
            '32a4b8c709b1a39b8f53ce5da8a592b8b67c98d6fee7de57ef6f3393d385c4f6'
            '6f6f94798ed49083fec99f54c9dd90cf95c86eeaf6f17dcee01b00bb194207b5')

package() {
    cd "tidal-hifi-${pkgver}"
    install -d "${pkgdir}/opt/tidal-hifi/" "${pkgdir}/usr/bin"
    cp -r * "${pkgdir}/opt/tidal-hifi/"
    chmod +x "${pkgdir}/opt/tidal-hifi/tidal-hifi"
    ln -s "/opt/tidal-hifi/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/tidal-hifi.png"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" -t "${pkgdir}/usr/share/applications"
}
