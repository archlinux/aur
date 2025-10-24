# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=mqttx-clean-bin
pkgver=1.12.1
pkgrel=1
pkgdesc="A Powerful and All-in-One MQTT 5.0 client toolbox for Desktop, CLI and WebSocket."
arch=('x86_64')
url="https://mqttx.app"
license=('Apache')
depends=()
source=('https://www.emqx.com/en/downloads/MQTTX/v1.12.1/MQTTX_1.12.1_amd64.deb')
md5sums=('19b8af296bae054854736654c0a15953')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"

    # Move icon to correct path.
    mkdir --parents "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/mqttx.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mqttx.png"

    mkdir --parents "${pkgdir}/usr/bin"
    ln -s /opt/MQTTX/mqttx "${pkgdir}/usr/bin/mqttx"
}
