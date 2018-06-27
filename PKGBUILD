# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=2.0.5
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('528cf09face492f5b0604c0749aaa7ddef07e197a5e61a0595e362659876be4fa41db134f6c35094552e7b379a225d1f0f404f008bfc9b8102a723e9eb145eb0')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
