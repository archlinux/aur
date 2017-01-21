# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=mqttfx-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A MQTT Client written in Java based on Eclipse Paho"
arch=('x86_64')
url="http://mqttfx.jfx4ee.org"
license=('Apache')
options=('!strip' '!upx')
source=(
  "http://www.jensd.de/apps/mqttfx/1.3.1/mqttfx-${pkgver}-64bit.deb"
  "mqttfx.desktop")
md5sums=(
  "4429b9d5c8e10eaeb1f7784047f36502"
  "0ce12491a9910a9c889356b04922f0f9"
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
  install -D -m644 "mqttfx.desktop" "${pkgdir}/usr/share/applications/mqttfx.desktop"
}
