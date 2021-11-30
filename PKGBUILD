# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpcov

pkgname=phpcov
pkgver=7.0.2
pkgrel=1
pkgdesc="A command-line frontend for the PHP_CodeCoverage library."
url="https://github.com/sebastianbergmann/phpcov"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('f44fdd17bbab303cf967b2318d1d71b1a1d6f71db302efc51ba8a2fabc14a6dc5057b33e56464ceb52015656ec98a618d17f82cdd2851a4ad1019015d998e800'
            'c4f90f349294ecc95905c856817cc7ad09cd62bba88a625ad2ac31c5a2379d75e7178fdfa23f3b1f5a7ff04e446bb744897cada35142a74301a92c9e5cdd8a31')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
