# Maintainer: Malachi Soord <me@malachisoord.com>
pkgname=psalm
pkgver=3.10.1
pkgrel=1
pkgdesc="Psalm is a static analysis tool for finding errors in PHP applications, built on top of PHP Parser."
url="https://getpsalm.org"
arch=('any')
license=('MIT')
depends=('php')

source=("https://github.com/vimeo/psalm/releases/download/${pkgver}/psalm.phar")
sha512sums=('6009e55302fe27801d5c1174a87eecd5ad25bdd285c2bbaaf253116e6f6f7b501a1866ecef94c6a94666674ca564024bb35f6aafc79e8f95ab0134241bf5fd35')

package() {
  install -D -m 755 ${srcdir}/psalm.phar ${pkgdir}/usr/share/webapps/bin/${pkgname}.phar
  install -d ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/bin/${pkgname}.phar ${pkgdir}/usr/bin/${pkgname}
}
