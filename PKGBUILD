# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phpmetrics
pkgver=1.1.1
pkgrel=2
pkgdesc='A static analysis tool for PHP'
url="http://www.phpmetrics.org/"
arch=('any')
license=('MIT')
depends=('php')
source=("https://github.com/Halleck45/PhpMetrics/raw/v${pkgver}/build/phpmetrics.phar"
        "https://raw.githubusercontent.com/Halleck45/PhpMetrics/v${pkgver}/LICENSE")
md5sums=('fbc5f2d0f3930f0a941077bd2566a594'
         '98c47c276d10a1201dc924b099e2ec00')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${srcdir}/phpmetrics.phar" "${pkgdir}/usr/share/webapps/bin/phpmetrics.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/webapps/bin/phpmetrics.phar "${pkgdir}/usr/bin/phpmetrics"
}
