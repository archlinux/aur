# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

pkgname=mill
pkgver=1.1.8
pkgrel=1
pkgdesc="A shiny new build tool for Java and Scala, designed for performance and reliability"
arch=('any')
url="https://com-lihaoyi.github.io/mill/"
license=('MIT')
depends=('bash' 'java-environment')

source=("mill-binary::https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/$pkgver/mill-dist-$pkgver-mill.sh")
sha512sums=('22feb95954a2b4d06642d92cdb775b9aeeaa7d52e8e425344727a2efaa5c732cdcf31b39eedadebf0b089a1c3c060076d6605214d9c11d19b05ef04d7e01e447')

prepare() {
  chmod +x "$srcdir/mill-binary"
}

package() {
  install -Dm755 "$srcdir/mill-binary" "$pkgdir"/usr/bin/mill
}
