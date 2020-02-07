# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.8.5
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('2f999fdff3c2b7d0d78699102f2168ef2e5edb4370d14ac86345a50515979a24887cfea353e3d60c578952708a47a8400a48f9a2a19e8edf3c10c4f83061f372')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
