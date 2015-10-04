# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phpcov
pkgver=2.0.1
pkgrel=1
pkgdesc="A command-line frontend for the PHP_CodeCoverage library."
url="https://github.com/sebastianbergmann/phpcov"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('69f2eaea1f07a8e0b5b894fc30458513cadcdfdfb63392c0dfcc314594b9fa34b1d5d47c60c81ca41f96eb540dfe96040bc3e1e68226f8aabfe0ccc62a00e7a0'
            '67251aea87ad2056acf0bb57b7e80011c428895f9c61c5016be7e1fea51bbe6b9c6b726928c584a35c6bc02d67a2b8372fcc32a4d4480dfd1b7bf5d62ca83b9a')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
