# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.2.10
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('22528076793622902a91079dac9e1e17db414e77216b3a541a63cc8dfe2e271881fb244b37f337b25668ed5e1429c0c5c9a662f20b0c5c147609d64d49eb2d91')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
