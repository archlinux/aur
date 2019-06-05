# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.4.2
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('a8cf36059b329cb5b058c37f8a27545e2670ac52dc9bd44a6b6fbe5539747b7ff10d0ab27e88377b80a52af8163b67e07fe9151a8e5b21740dc3dfdd2c0a92fe')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
