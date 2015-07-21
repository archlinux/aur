# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phpmetrics
pkgver=1.1.1
pkgrel=2
pkgdesc="A static analysis tool for PHP"
url="http://www.phpmetrics.org/"
arch=("any")
license=("MIT")
depends=("php")
source=("https://github.com/Halleck45/PhpMetrics/raw/v${pkgver}/build/${pkgname}.phar"
        "https://raw.githubusercontent.com/Halleck45/PhpMetrics/v${pkgver}/LICENSE"
        "${pkgname}.install")
md5sums=('fbc5f2d0f3930f0a941077bd2566a594'
         '98c47c276d10a1201dc924b099e2ec00'
         '4b2b590f00765d9abdeebe5b0a100ed8')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
