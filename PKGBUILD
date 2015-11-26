# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phpmetrics
pkgver=1.5.1
pkgrel=1
pkgdesc="A static analysis tool for PHP"
url="http://www.phpmetrics.org/"
arch=("any")
license=("MIT")
depends=("php")
install="${pkgname}.install"
source=("https://github.com/Halleck45/PhpMetrics/raw/v${pkgver}/build/${pkgname}.phar"
        "https://raw.githubusercontent.com/Halleck45/PhpMetrics/v${pkgver}/LICENSE")
sha512sums=('fcd9ed9965291270667c129cce1a79abc9baa30873108a9b915ca588f56feb73a8105d2c2e8898e2df0eab80dcbf4ce5db7b16530b34bbcbe6aa4273299e25f2'
            'be822058c3c747ff43933ef66163ae99ed3901f8633f561811ada1d7d761309188301ae6ace33d3f53195793f0a500462ee666c7089faa2c80b6d9809a1b61b3')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
