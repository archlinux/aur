# Maintainer: levyd

pkgname=gloomhaven-helper
pkgver=8.4.8
pkgrel=1
pkgdesc="Gloomhaven Helper is the officially licensed companion application for playing the Gloomhaven board game."
arch=('any')
url="http://esotericsoftware.com/gloomhaven-helper"
license=('unknown')
depends=('java-runtime>=8' 'bash') 
source=(http://esotericsoftware.com/files/ghh/GloomhavenHelper-${pkgver}.zip
gloomhaven-helper.sh)
sha256sums=('b35bf9d5ac7acea2437bb1cafb6516ce9d4988fc8f06077cd0323bd3e666ab21'
            '3e2c22d22ef2056be278906554900d1fa9c6b7a07f3ee75a5120cfe55463b28c')
package() {
  install -d "$pkgdir/usr/share/java/$pkgname"

  cd "$srcdir"

  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir/GloomhavenHelper"

  install -Dm644 *.jar "$pkgdir/usr/share/java/$pkgname"
}
# vim:set ts=2 sw=2 et:
