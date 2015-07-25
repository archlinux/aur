# Maintainer: Martin Minka <martin dot minka at gmail dot com>
pkgname=arcbotics-sparki
pkgver=1.0.5.5
pkgrel=1
pkgdesc="SparkiDuino 1.0.5.5 library and examples to easily start programming AcrBorics Sparki robot using Arduino syntax."
arch=('any')
url="http://forum.arcbotics.com/viewtopic.php?f=17&t=1133"
license=('LGPL3')
depends=('arduino10' 'unzip')
source=("http://d3k8ss0l8daviq.cloudfront.net/Sparki_Library_${pkgver}.zip" "sparki_usb")
md5sums=('e03dbf9efe9afa55df5eefd3c2d306b0'
         '66f72fd584b178873ce003aba8ebd8cb')
build() {
    rm -f Sparki_Library_${pkgver}.zip
}
package() {
  install -d "$pkgdir/usr/share/arduino/libraries/Arcbotics_Sparki"  
  cp -a . "$pkgdir/usr/share/arduino/libraries/Arcbotics_Sparki"
  install -Dm644 "$srcdir/sparki_usb" $pkgdir/usr/bin/sparki_usb
}
