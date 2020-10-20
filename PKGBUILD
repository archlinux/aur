# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=4.0.1
pkgrel=2
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('306fd56ac4fee47f4b2ab9199c2f08554f935ef4752a9c88e18967fa5ae1036adb259202aabcf0e351f98cd4a4a5a099dcfb509cded8a3046c18e377a74d2348')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
