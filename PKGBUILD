# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.6.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('c5fdabaa3609fdfa94ca8beddb9d310369bb43f47715895da0251205faf0d9e998f5cac22ed7b4ac72647182c70fb283fdb2adfed37b8dd7543f2896d0611187')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
