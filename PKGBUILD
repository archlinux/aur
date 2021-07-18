# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=serialport-assistant-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A SerialPort Assistant written in qt"
url="https://github.com/duapple/serialport"
arch=('x86_64')
license=("Custom")
depends=('qt5-serialport')
makedepend=('imagemagick')
provides=('bash2048')
source=("https://github.com/duapple/serialport/releases/download/28686cc/serialPortAssistant"
        "https://raw.githubusercontent.com/duapple/serialport/master/image/icon1.ico"
        "serialportassistant.desktop")

md5sums=('af814714b71034e6b9e6594df1019b2e'
         'b8794f1aaa97dad96ddf74e8e7c6d678'
         '77220706c24d3dc0760095ee0ed64575')

package() {
  cd $srcdir
  convert icon1.ico serialportassistant.png
  install -Dm 755 serialPortAssistant "$pkgdir/usr/bin/SerialPortAssistant"
  install -Dm 644 serialportassistant.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/serialportassistant.png"
  install -Dm 644 serialportassistant.desktop "${pkgdir}/usr/share/applications/serialportassistant.desktop"
}
