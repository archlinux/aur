# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

pkgname=mill
pkgver=1.1.10
pkgrel=1
pkgdesc="A shiny new build tool for Java and Scala, designed for performance and reliability"
arch=('any')
url="https://com-lihaoyi.github.io/mill/"
license=('MIT')
depends=('bash' 'java-environment')

source=("mill-binary::https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/$pkgver/mill-dist-$pkgver-mill.sh")
sha512sums=('b97aaf809e9681e221e52d2c9babc8b07b5de1e47bdd67cd972b99f13dd6dc27c94352867833a5914df8efbd08347f04e418d48e39f91bc72d3ffdc4d935165a')

prepare() {
  chmod +x "$srcdir/mill-binary"
}

package() {
  install -Dm755 "$srcdir/mill-binary" "$pkgdir"/usr/bin/mill
}
