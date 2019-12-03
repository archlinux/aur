# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.7.2
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('b30d09452b68606df3a2965761187aa8f912338dabfabfb524c5df0890d8ec75080d995c3b8c9a50e97c2a3996a8174ad7a252cdfc330cc65ae99805a04f5c66')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
