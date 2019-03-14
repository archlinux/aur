# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.2
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('b787f65451a298cb00928424cef3b8df16c42110d508310cfb18fe562d44b434e7fc623d785b6b76db3d6e94d09a48c1ca5cb1516b304aa9438fc91878667c84')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
