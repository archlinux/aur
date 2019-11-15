# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.6.6
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('c2741a50ee6a56d664588919a5b26adadb17a41fc81e85377005acfc6bbd40ba6edfb2167b9ed4bc04d9bd4334ae18f107d60bf96fe4b4241de72a09ea0cddff')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
