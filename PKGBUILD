# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tvrenamer-bin
pkgver=1.0b4
pkgrel=2
pkgdesc="A Java GUI utility to rename TV episodes from TV listings"
arch=('x86_64')
url="http://tvrenamer.org"
license=('GPL2')
depends=('java-runtime>=8' 'java-runtime<=11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/tvrenamer/tvrenamer/releases/download/v$pkgver/TVRenamer-$pkgver-gtk64.zip"
        "${pkgname%-bin}.desktop"
        "${pkgname%-bin}.png"
        "${pkgname%-bin}.sh")
sha256sums=('017f093a0b899e0cf4328764cd44d161c54e3ae6a873fe5768ba71b81fdb5108'
            '8876483be682b55125c0a42f9129654319a3690df34182eaa5870c5a96c585da'
            'b3a5d18a04c1b8af204488e753210e104e9591d6703e5830504fc334231efabd'
            'cb37362c7e630b02643ffa03f26cee8d9ac5193f69cb3b0a22460e079c9b0bfa')

package() {
  cd TVRenamer-$pkgver
  install -Dm644 "${pkgname%-bin}.jar" -t "$pkgdir/usr/share/java/${pkgname%-bin}"
  install -Dm644 "$srcdir/${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/${pkgname%-bin}.png" -t "$pkgdir/usr/share/pixmaps"
  install -Dm755 "$srcdir/${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
}
