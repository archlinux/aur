# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.11.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('0f1fefd96249d22cf5c69581b762f5352c2177433e4fa09aa29bb9afa64e11a34505b17d09686569c722e197a961afce70f3bbb34486c433ee2d0e0bff5c7491')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
