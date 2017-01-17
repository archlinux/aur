# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=mqttfx-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A MQTT Client written in Java based on Eclipse Paho"
arch=('x86_64')
url="http://mqttfx.jfx4ee.org"
license=('Apache')
options=('!strip' '!upx')
source=(
  "http://www.jensd.de/apps/mqttfx/1.2.1/mqttfx-${pkgver}-64bit.deb"
  "mqttfx.desktop")
md5sums=(
  "f889407aa65219f46cf4c0ba382976d6"
  "969bd490389ef4c4423c10e49883a7d9"
)
depends=()

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"

  install -d -m755 "${pkgdir}/opt/MQTTfx"
  
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  
  ln -s "/opt/MQTTfx/MQTTfx" "${pkgdir}/usr/bin/mqttfx"
  ln -s "/opt/MQTTfx/MQTTfx.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mqttfx.png"

  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -D -m644 "mqttfx.desktop" "${pkgdir}/usr/share/applications/mqttfx.desktop"
}
