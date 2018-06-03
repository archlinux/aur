# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=2.0.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('93d9099c246c8fc233bded087d568da059f30970c97370fc40d42e26c855bddd4b7f63d891f0edacd83272c5f6e9abca747aa17ae3200d01960d09f993e98f23')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
