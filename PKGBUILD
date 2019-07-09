# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.4.8
pkgrel=3
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('b7723d5200b7ce96f3bd6877d05403bab071e800b6d6311aa4172285f71073e83bda5ccb962c8bd7e65aa57487b6b5485de03def194dc542794beb75345675ab')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
