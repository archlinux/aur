# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.15
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('d011de2f6cb828f9083b4fceaf4306d35e87e9bc9722a45b62487bd393a1ccde08d921c29dd920ccfdd47c56fd3114860d1af05f3613d36947c76cdce7b2099f')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
