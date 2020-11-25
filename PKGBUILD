# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.2.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('f2bc6854cd83aff4c3ef4c4e8c507a0b72e3d8af61d7a68ca42d859fe3395e897919a1544bb636a5daae2cf60a63735204b3edb914a3c88feac8de92cd384536')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
