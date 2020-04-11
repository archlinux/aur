# Maintainer: levyd

pkgname=gloomhaven-helper
pkgver=8.3.1
pkgrel=1
pkgdesc="Gloomhaven Helper is the officially licensed companion application for playing the Gloomhaven board game."
arch=('any')
url="http://esotericsoftware.com/gloomhaven-helper"
license=('unknown')
depends=('java-runtime>=8' 'bash') 
source=(http://esotericsoftware.com/files/ghh/GloomhavenHelper-${pkgver}.zip
gloomhaven-helper.sh)
sha256sums=('c937fa37bdbe72e65c780aefb9c3de741a16140f26b701c2d8a192bd8196dcce'
            '3e2c22d22ef2056be278906554900d1fa9c6b7a07f3ee75a5120cfe55463b28c')
package() {
  install -d "$pkgdir/usr/share/java/$pkgname"

  cd "$srcdir"

  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir/GloomhavenHelper"

  install -Dm644 *.jar "$pkgdir/usr/share/java/$pkgname"
}
# vim:set ts=2 sw=2 et:
