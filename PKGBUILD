# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.7.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('c6793764a2c0d58ec3deb583697847c6e4acb89cf653370328db518b36bf48e9fb6ed457db97fc4f7b3a70f266691cbbccd2d50ae1d6d50fab062833abc880eb')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
