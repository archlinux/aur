# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.6.4
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('82f7f9bb5e86b3cdda9a7cc3806162d7175c9fc2550bff412fa23bc1e9d8707e47fb2274eba5bf7286b03966f551ce5a6496e5520517c56291a4313d3d9caa73')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
