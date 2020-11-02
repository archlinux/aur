# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.1.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('95cf421321a8e48b1a7b940155358f3cddab2d4be5ba4f7c7ba2811f99e3227aba55388320d873e8b34b5dbd17bc54a2fce0a6dc8ede4321c23e8ad45b7548b3')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
