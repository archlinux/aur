# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.1.3
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('4a65a73e716f9def56323ec895f6d81d9d6498d6cd9e884907e7d385bafca22c31afbb0569730ad9c802f813375719eaa7301b56349e14ee385899f9e811abc3')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
