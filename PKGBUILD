# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

pkgname=mill
pkgver=1.3.1
pkgrel=1
pkgdesc="A shiny new build tool for Java and Scala, designed for performance and reliability"
arch=('any')
url="https://com-lihaoyi.github.io/mill/"
license=('MIT')
depends=('bash' 'java-environment')

source=("mill-binary::https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/$pkgver/mill-dist-$pkgver-mill.sh")
sha512sums=('066a8af890854fef82f539f50831e01f1f9a58d2edb82f1a1a6e424476d2d90f634c5e107e2882b1120583942b88c6c48aff490166860b1a0453d770ddd721ae')

prepare() {
  chmod +x "$srcdir/mill-binary"
}

package() {
  install -Dm755 "$srcdir/mill-binary" "$pkgdir"/usr/bin/mill
}
