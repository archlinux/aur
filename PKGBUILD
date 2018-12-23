# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.0.7
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('0c444f50d9b357fbd3420795ababe7de3cfceeec086cef758a1334b47d3046c4b73831a164482cb366e123fae6226a09fbd9ac02daab31bf29fdd716857ebd2e')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
