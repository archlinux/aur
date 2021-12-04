# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=v4.14.0
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("$pkgname-$pkgver.phar::https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('b5cccffb22958e9809d2f3ab178b6ca00d9c06e4a2f75074a83128215347e92df1159890d1d63541c966d0a18648f3a1be614c15192ada039c52721f4138095f')

package() {
  install -D -m 755 ${srcdir}/$pkgname-$pkgver.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
