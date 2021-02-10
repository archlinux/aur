# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.5.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('653ca15ad3d48f5bdb53b2f8646c94e46f9d8e960b9c5ce3e420b41f6c9b0fa338bce5d935c57153462f5c3532e3e8c8094a494e5c3c451e906d186d5908fba4')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
