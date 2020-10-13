# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.17.1
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('40662031450f3a0ffac5bb3e11505db15e36e876e1806a4a4085f47b31be48241f4d4c712c140656a18cfd48997fa9e60b10a56cfb1587dbf0b5e7cf612bb991')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
