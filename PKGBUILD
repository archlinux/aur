# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.12.2
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('6739037d1213a42163c129b082e82be922a449be575aa6af94d19dc852ce5f451d07e699f193a178968159e13fcb50d18ef904acbab9640c6565202f6c73d835')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
