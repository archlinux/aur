# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

pkgname=mill
pkgver=1.1.2
pkgrel=3
pkgdesc="A shiny new build tool for Java and Scala, designed for performance and reliability"
arch=('any')
url="https://com-lihaoyi.github.io/mill/"
license=('MIT')
depends=('bash' 'java-environment')

source=("mill-binary::https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/$pkgver/mill-dist-$pkgver-mill.sh")
sha512sums=('41102495827e82a4ff2692acc6af176890e9e5d64c0c94cff4e8d2623bd273127a5cac06ce2bcd7e61e9138e1847a52bd02d5a4d2118095f0993dd2556357142')

prepare() {
  chmod +x "$srcdir/mill-binary"
}

package() {
  install -Dm755 "$srcdir/mill-binary" "$pkgdir"/usr/bin/mill
}
