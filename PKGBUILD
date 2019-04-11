# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.2.6
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('988a5e35aca2a054c443a86af22bfbb064e885e74186803292255d115ef3027b544ec4979f0954189c0e5d47a1cc71a38ea0baa5bbe5ca4e1c2988b5dbeec33e')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
