# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phpunit-skeleton-generator
_pkgname=phpunit-skelgen
pkgver=2.0.1
pkgrel=1
pkgdesc="A tool that can generate skeleton test classes from production code classes and vice versa."
url="https://github.com/sebastianbergmann/phpunit-skeleton-generator"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${_pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('7b15ffafb4083f416fcde3c486a7333ac0d8b14c20e7478d6f9222754fed9680a1db56bd4d198481fc769b87e335510b69ada4f98f5c47a4eb6528cf0dc35e4c'
            '89011dee7edb6865985beb93757c084c9cee31e8b74bb0c10c5fa88db91b9d6645b98ee970a4d2ab377bf3b3bf52aacdba034c54143d4007b0e46787dc1207ab')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
