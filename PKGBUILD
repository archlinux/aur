# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpcov

pkgname=phpcov
pkgver=5.0.0
pkgrel=1
pkgdesc="A command-line frontend for the PHP_CodeCoverage library."
url="https://github.com/sebastianbergmann/phpcov"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('780ecf6ef5a07801b107659cac4019ac3738833311408bc43d6fbe1041b974ea311ea581c06a49f7fc1d8ff953c36e7cb92b87fb7ad81e0cc1b8f04e7df5d37e'
            '69613225fea90975f8164b38fb486e27b37ec4f10f785599f930dfcf0920e9737ef69a161ffd042c9b6bdee2b36df350647def58e42fd5f62b4b4b86b8f46fd6')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
