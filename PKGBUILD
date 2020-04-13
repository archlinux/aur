# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.11.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('60a17cf242f5245b362ea930b3ae3eb70926a0c2a7d671cbb91a89c08b3c6495e12c092d4f14c073ebbb3b76b09f1b2a390bacd33b1242348a75c3da38f96f53')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
