# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.13.1
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('a95ba59e0ff4de995490cd0938cd1293ade6d7907126bdd497cd551f9d6624a1e5cb0adeeeba8ae780698e5a75476d3a0acf5cb74eb675a2be5a124518965be4')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
