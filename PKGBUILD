# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.12.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('d05461b6b4107ea650b3902e20016e83968cdb1dd4492c17984b88b0353bda18693cb27e24ebb7877bf00cef1a78f3eaa4215b5d7a704412b742684171f4c71a')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
