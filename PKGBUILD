# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.11.2
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('dfb269a1987166b2d982677611fe5c46cddd058b868c6726b6bf6a4254a5c64aac4a374318e098d35fab3afc2e893320d3b90c546fbfea6f893fedcc2ee6bf9b')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
