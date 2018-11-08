# Contributor: Juanma Hernandez <juanmah@gmail.com>
# Maintainer: Juanma Hernandez <juanmah@gmail.com>

pkgname=mqttbox
pkgver=0.2.1
pkgrel=1
pkgdesc='Developers helper program to create and test MQTT connectivity protocol'
arch=('x86_64')
url='http://workswithweb.com/mqttbox.html'
license=('apache')

sha256sums=('04da099de5a9c38733cf9649e614c24780d3a3bbc2a8f2e7d38409bbd3adb876' 'f22b10da73d4146610d6bb7f305f6514380e760db9f7381092139abbabd06220' 
'0ea0566f40fdf544510090441faaba745816ad1d438f3efe72197eb630f0e1f7')

source=('MQTTBox.desktop' 'MQTTBox.png' 'https://s3-us-west-2.amazonaws.com/workswithweb/mqttbox/latest/linux/MQTTBox.tar.gz')
        
package() {
  install -dDm755 "$pkgdir"/usr/{bin,lib/mqttbox}
  mv "$srcdir"/MQTTBox-$pkgver/* "$pkgdir"/usr/lib/mqttbox
  ln -s /usr/lib/mqttbox/MQTTBox "$pkgdir"/usr/bin/MQTTBox
  install -Dm644 "$srcdir"/MQTTBox.desktop "$pkgdir"/usr/share/applications/MQTTBox.desktop
  install -Dm644 "$srcdir"/MQTTBox.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/mqttbox.png
}
