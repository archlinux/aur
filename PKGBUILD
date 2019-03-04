# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.1.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('14c7c7a6779ddc950d7e95f6551d0ce5bf88e030f471570bdcc3c514b6d64c7128e23f3e50ccdae71b71ce287a3739ad039bf43a0b7963c15c245ec9de8cfad4')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
