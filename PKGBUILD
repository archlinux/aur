# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.2.5
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('aaebeddcb62f2d7c93f484d8530e0858df842b4eec31c43b0315d7fa325ede679ae107306f96fc49e9a0c0d523474bb688431f557993f6970aaf5736d2cd3555')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
