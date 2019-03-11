# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.1.2
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('5a5d87604872e4e20fd22891bbe68ffc97724ba3534c34ffbb846d36c1073aa52d7f02f9614f56c620ab2efd6127ae86b60edf7b8e072cb65d5ab8e6af61c20c')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
