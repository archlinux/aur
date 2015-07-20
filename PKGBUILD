# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=pdepend
pkgver=2.1.0
pkgrel=2
pkgdesc='A tool for PHP software metrics'
url="http://pdepend.org/"
arch=('any')
license=('BSD')
depends=('php')
install='pdepend.install'
source=("http://static.pdepend.org/php/${pkgver}/pdepend.phar"
        "https://raw.githubusercontent.com/pdepend/pdepend/${pkgver}/LICENSE"
        "pdepend.install")
md5sums=('a865a41bc90c8ad121f6055e633f9442'
         '672b04a52b75ac6fbb6e4f0ed5713a35'
         '0b56639c95c48c1237f628648dd83e03')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/pdepend.phar" "${pkgdir}/usr/share/webapps/bin/pdepend.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/pdepend.phar "${pkgdir}/usr/bin/pdepend"
}
