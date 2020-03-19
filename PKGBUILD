# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.9.5
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('20a3ac74e6c7d8b99252d09e518bb20a864dbaf7a3507709a9ea39afb95298186e280b8266de740bee0bb9e9f820b40199dd12940d9c7c6e80a1768da1ef2be0')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
