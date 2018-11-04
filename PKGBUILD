# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=2.0.16
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('72a33323097227e9a83a7ed6f0b06530168ea6d38e1cc0342298b69f20ec1a0b02799cef814055d4209d812b321c9bb633be26304c66b498b8d99edc0a4789df')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
