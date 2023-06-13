# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpcov

pkgname=phpcov
pkgver=9.0.0
pkgrel=1
pkgdesc="A command-line frontend for the PHP_CodeCoverage library."
url="https://github.com/sebastianbergmann/phpcov"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('5cbef729c67750b157f5f5b24adc866db6dc3f9aa8cfe4558f1af05ac7360b8762e0bc70a8832d49d86d2cb76366bd23687449bf58db733a4832e34cd3e71433'
            'b3c801f6adea0632663b37411f5a7b37ac0ff0a55bc7d993b14eb884c55c4665d660e0e20127a5be070a1e6bbad98453378008f0138ee40f2577c7a4332b2e67')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
