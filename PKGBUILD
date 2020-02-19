# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.9.3
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('76f754736017548ed6ee17c7b7f7f3a64067f47e2283a5b5dee8d447a70089688b09469d72eb1d232760735c971955e2b115f3a009b049dedfcc64f2be0b7df0')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
