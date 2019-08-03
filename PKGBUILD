# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=mqtt-explorer-appimage
pkgver=0.3.5
pkgrel=2
pkgdesc='Explore your message queues.'
arch=('x86_64')
url='https://github.com/thomasnordquist/MQTT-Explorer'
license=('AGPL')
provides=('mqtt-explorer')
conflicts=('mqtt-explorer')
depends=('fuse')
options=(!strip)
_appimage="MQTT-Explorer-${pkgver}.AppImage"
source=(
    "MQTT-Explorer-${pkgver}.AppImage::https://github.com/thomasnordquist/MQTT-Explorer/releases/download/v${pkgver}/MQTT-Explorer-${pkgver}.AppImage"
    "mqtt-explorer.desktop"
    "mqtt-explorer.png"
    )
noextract=("${_appimage}")
sha256sums=(
    '61fcf8dbe755231df1c083a6625b69e5ef6b6246be2ac92f42ec495550606e0e'
    'SKIP'
    'SKIP'
    )

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/mqtt-explorer
    chmod +x "${pkgdir}/usr/bin/mqtt-explorer"

    install -Dm644 "mqtt-explorer.desktop"                    "${pkgdir}/usr/share/applications/mqtt-explorer.desktop"
    install -Dm644 "mqtt-explorer.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mqtt-explorer.png" 
}
