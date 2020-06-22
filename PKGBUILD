# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.12.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('ecb5f038ea8cef8b21cfab5527e24d89e74990da0b8f07a73cdedbe5b0ab37f012fe17a1ef040f32c43dd03276ae93e23d47e7ec14f7861c5e12d3262cf30dc0')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
