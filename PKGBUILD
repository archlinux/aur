# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.14.0
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('4ac5ec38d4072e8497ac67550efd65dcfb6d030fce062963169390f37157b9ec35dd3035c3b2a2c5a0ebf5421744650599534ca37f5ba1996816499590913e67')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
