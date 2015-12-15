# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phpmetrics
pkgver=1.8.1
pkgrel=1
pkgdesc="A static analysis tool for PHP"
url="http://www.phpmetrics.org/"
arch=("any")
license=("MIT")
depends=("php")
install="${pkgname}.install"
source=("https://github.com/Halleck45/PhpMetrics/raw/v${pkgver}/build/${pkgname}.phar"
        "https://raw.githubusercontent.com/Halleck45/PhpMetrics/v${pkgver}/LICENSE")
sha512sums=('5cbab771fde11dc8a9b34aa57ca1c961abecaa0534daec23c9eaa69b472c046995b2a40768f038d0cfedf22b60d666235a319ab706cb3a498e82cf71827aa078'
            'be822058c3c747ff43933ef66163ae99ed3901f8633f561811ada1d7d761309188301ae6ace33d3f53195793f0a500462ee666c7089faa2c80b6d9809a1b61b3')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
