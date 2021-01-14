# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.4.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('53d039915608f2b2fb313b02b90438eb38f5889929a0b89a553b3c5f24b57c988d82a23338c030775042f0aebe6de274bf53b8a320aef03442b0505155e0b0bf')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
