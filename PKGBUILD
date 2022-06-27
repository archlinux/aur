# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.24.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('d1c893fa4166a1142faf95e36353acad561ff1a9beb0c8a8550424c544b2ef016606f5f9d877f1330e03cd5ec2b151d806cc8d136c2110f11fe083aed871b88b')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
