# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.6.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('91ae35df62deedc1d1e21439cc44e46e3d2ae2dc69794379639b586c7673e3586f6b6081dfddfc252b678ccbd22d55535c140cd3847d032d33c619ae66ca2c60')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
