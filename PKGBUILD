# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=mqttfx-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="A MQTT Client written in Java based on Eclipse Paho"
arch=('x86_64')
url="http://mqttfx.org"
license=('Apache')
options=('!strip' '!upx')
source=(
  "http://www.jensd.de/apps/mqttfx/${pkgver}/mqttfx-${pkgver}-64bit.deb"
  "mqttfx.desktop")
md5sums=(
  "b17b8339f85c2052cf9447c9caa0149d"
  "0ce12491a9910a9c889356b04922f0f9"
)

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"

  install -d -m755 "${pkgdir}/opt/MQTTfx"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  
  ln -s "/opt/MQTTfx/MQTTfx" "${pkgdir}/usr/bin/mqttfx"
  ln -s "/opt/MQTTfx/MQTTfx.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/MQTTfx.png"
  install -D -m644 "mqttfx.desktop" "${pkgdir}/usr/share/applications/MQTTfx.desktop"
}
