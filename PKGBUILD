# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpcov

pkgname=phpcov
pkgver=4.0.4
pkgrel=2
pkgdesc="A command-line frontend for the PHP_CodeCoverage library."
url="https://github.com/sebastianbergmann/phpcov"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('8ef3fcb45b192bfc8c5b62461e6b2de93780ab41a064c4d203a51c97dcc039f81065326b368a4e74dfcec47c7845a50282cd97260476ea119c74d16de376f621'
            '69613225fea90975f8164b38fb486e27b37ec4f10f785599f930dfcf0920e9737ef69a161ffd042c9b6bdee2b36df350647def58e42fd5f62b4b4b86b8f46fd6')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
