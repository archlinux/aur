# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.0.11
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('9c81f571f60397b05c966f1cebeea75ca5e564498853700510ace6de10367e90877fe3e59817422f61cedac4810d6171021feaec64d7d0a298cc0c922a413ec9')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
