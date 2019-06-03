# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.4.0
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('ca1db286632cbb3ce030d1e8d509441d121f27c14a4369646b27b1f4956df3920f5306f2916897e33603ab58a493c195e9fd359118090f6d896f9ef2d3158add')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
