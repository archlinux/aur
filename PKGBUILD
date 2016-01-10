# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=phpcov
pkgver=3.0.0
pkgrel=1
pkgdesc="A command-line frontend for the PHP_CodeCoverage library."
url="https://github.com/sebastianbergmann/phpcov"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('a4b8412f7fe4e78340f823aeb6943b877d9ae3b0e49494f9e6926db4470672b77532a91f4be56d8fae0031d0b1be71e94d75321c2219525426bb9f665a55bb3f'
            '0c378b544f9c7b28ef0cb9c7e43dfb9108943c6a050a7cd28bcfa713f091659c6766c56ef2736d133e4644a79d10ba96fcfb2bd65a52a5137d4d0d3933db442a')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
