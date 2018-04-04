# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=1.0.6
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('45f8fe825865c955efb7ea18146accb411435e6946513244bb8897d6a203ba041b8d3a330eaeb1e541cad6c0be6a6342268d2efc81602583a524d708f0eb0539')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
