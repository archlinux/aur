# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpcov

pkgname=phpcov
pkgver=7.0.1
pkgrel=1
pkgdesc="A command-line frontend for the PHP_CodeCoverage library."
url="https://github.com/sebastianbergmann/phpcov"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('54390915cabcc314d792e2639f159eee1eca89d3c92dd8f271d0b7b686c2fc1216aabc589d05fa90b32c946f37fff0e404d6f7e841fb1ddae5f39d2abb469f9f'
            'c4f90f349294ecc95905c856817cc7ad09cd62bba88a625ad2ac31c5a2379d75e7178fdfa23f3b1f5a7ff04e446bb744897cada35142a74301a92c9e5cdd8a31')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
