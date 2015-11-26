# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phpmetrics
pkgver=1.5.0
pkgrel=2
pkgdesc="A static analysis tool for PHP"
url="http://www.phpmetrics.org/"
arch=("any")
license=("MIT")
depends=("php")
install="${pkgname}.install"
source=("https://github.com/Halleck45/PhpMetrics/raw/v${pkgver}/build/${pkgname}.phar"
        "https://raw.githubusercontent.com/Halleck45/PhpMetrics/v${pkgver}/LICENSE")
sha512sums=('81d33f55df8bc0bce60c1276fa2d029cd3254ba17278b23b5be9594376e8937a39810ee62a400531cfe0fdd1ebdf48f4515c49cb4faa15dc8b84e277df055d1b'
            'be822058c3c747ff43933ef66163ae99ed3901f8633f561811ada1d7d761309188301ae6ace33d3f53195793f0a500462ee666c7089faa2c80b6d9809a1b61b3')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
