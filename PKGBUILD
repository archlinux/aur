# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.3.0
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('3de8763d89b289480eda39884909d9a95a3d8dc2f9307767628e7d2119c3f851b4ec2c52d577c97cb857aac8148c61b3ac0484ed0808e64ac0b94c99eda8ed68')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
