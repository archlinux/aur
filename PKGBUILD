# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.1.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('f403a754386c166d4ba1846be977644df17dfd5b10669e3e7610a70ae8d77d2416c5a692bfc30a702098c8938da54f73c781460e68aeb30b1329b194e8751dc2')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
