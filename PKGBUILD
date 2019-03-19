# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.2.2
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('7e6dee8d53c5bca3707e13e01ee83a6e0bc70cae0cb3df725a9bf5a4f08c200776526df0046ca9fc0096f531a250f610759ddf9df25b464e3b0ee8e188649700')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
