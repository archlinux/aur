# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=mqttfx-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A MQTT Client written in Java based on Eclipse Paho"
arch=('x86_64')
url="http://mqttfx.org"
license=('Apache')
options=('!strip' '!upx')
source=(
  "http://www.jensd.de/apps/mqttfx/${pkgver}/mqttfx-${pkgver}-64bit.deb"
  "mqttfx.desktop")
sha256sums=(
  "f350eb74b60b77ac8f2ce258216223f3a0f2aaa27ef55c2d7799a401a42efcca"
  "7037ab12fe192a62ef745e93a7661d9f5dc40a2ad5b07624201eac04f5ed070c"
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
