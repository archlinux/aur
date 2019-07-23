# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.4.10
pkgrel=3
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('7e3f503bf5cfc4d49f08bb68432414cfd3c0b08024e2a0d0396a76f8e0f012d3351e16cad26f303fe5a1a08f7a0bb7277dc0d389695280baeab536b655e05e0a')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
