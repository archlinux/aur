# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.2.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('a124f9a19c77deef67ac4390c3692b3d5b88d846d0aea8ad116d4d965d325e9a3ff0c5921cd0e78b533359de16dfd61092662f2e06f6301db44ca2b1cc03b469')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
