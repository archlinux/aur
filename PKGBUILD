# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.9.3
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('d86f587a576c919fdb5eab673386f2493744fe4d2cf3deb07cdeba103901c08760175514d76c16533e8a14e66612d44ab9726dbf742794bb30dcf67cdcf50cd4')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
