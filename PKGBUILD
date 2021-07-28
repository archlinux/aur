# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.8.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('6f3d04c2083a1ef23aad96b0b9cf96dd8188015e7d8e27e77905a2900f4c36de56acc20dbc2013edd82c145153e53db8bce1f29d0b858ee1c5f113d7a045e6d4')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
