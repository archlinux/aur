# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.14.2
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('7649d16d27080a9904546ec60f37ad2def8e77b48678eda1e5417b5cfa57cdbad041dfe545fd22ff1ff5a08f673a70abe8c9307ad0b391fafa9882050d484815')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
