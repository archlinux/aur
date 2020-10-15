# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.17.2
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('e5e3a3ba1543c6459b9f78b4ea09625d55bbca38e54d41c5e4c08f78cd1d3167512c718b5b7c07620c38328998a36b0d8ea77cd8f85ae75c44e2a4ffff4cabd8')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
