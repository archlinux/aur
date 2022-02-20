# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.21.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('585e09fc42a4ea0508c61f17c7ae90d359dec6e99f3f22509e17c10b720694f02aa0ebc6733be93b84ab0d3e961a7525231b838f08e22876b3df9fe3f5bc8416')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
