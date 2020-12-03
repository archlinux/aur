# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.3.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('b0dd780a45580fd2c5f10a7aa0269577533a9ac531cf56876371e603814e41f85653b37b75099535f29fd4a2b9dd43194bcfb898c4a275f49cc678714455788e')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
