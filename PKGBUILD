# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpmetrics

pkgname=phpmetrics
pkgver=2.1.0
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A static analysis tool for PHP"
url="http://www.phpmetrics.org/"
arch=("any")
license=("MIT")
depends=("php")
source=("https://github.com/Halleck45/PhpMetrics/raw/v${_pkgver}/build/${pkgname}.phar"
        "https://raw.githubusercontent.com/Halleck45/PhpMetrics/v${_pkgver}/LICENSE")
sha512sums=('cdd346eedf7e60c052cdc8d6029ebed5d92358cd08b4bbd5b82d906beb34358100ea6c8ec37b6552f37b60b26ce0b3127b3950f52f033765175517943aa95bf3'
            'be822058c3c747ff43933ef66163ae99ed3901f8633f561811ada1d7d761309188301ae6ace33d3f53195793f0a500462ee666c7089faa2c80b6d9809a1b61b3')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
