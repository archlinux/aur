# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.1.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('8304a39d94b3c29ed4359eb8fdda1a3ad96723a05310c50ca23ee060ad2c903b41ce7ff6b65bb8c1ca165ce9cea5494bf2ec50d894ba19ff454c1c353d0d477b')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
