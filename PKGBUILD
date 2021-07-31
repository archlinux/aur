# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.9.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('30b1deb4793d89aace209e7f1706d2f00f09032df601c1a4f9d5438e3e9c2f04e38055b40cb2bcd2280f1d871eacfee9807b16ae93675d1f708ebdab9af1f246')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
