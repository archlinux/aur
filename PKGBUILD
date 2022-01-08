# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.18.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('5b3164ea25fb1179d56e0127e180b96ab3ffb835899c07c6b66162d982aeb0f5622d96eb4ca0c52340ca2d8fd5d5a6a1fe0181f74ac416c39803219b73e1c648')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
