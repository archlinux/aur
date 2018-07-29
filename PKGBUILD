# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=2.0.9
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('93a99b2e9fec4fad64c2c0981ab11406b6a024b97de9cfd21823205989b39a03b699378903506cdcfc15fee0526dc26326602cc2300af418eb26fb77c2fd8ee4')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
