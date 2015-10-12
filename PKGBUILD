# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Co-Maintainer: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
pkgname=phpunit
pkgver=5.0.5
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('92754afacce92c760b2c5bced7aeaa560716f88745d8b6f8d14ee0371039b2b26a4f4d35a5ff08881ebb5cb8abd56b94f071ac8e93f06f1a20e5a5a107dee30d'
            '8cd4a84df128f54ef6cf657d2d6e4307b2f4fe92f60b94f6639c16c2ebcffcb20923fcfee3cf7becddf0e138c5affacb887ac43d356c7ef220f73e6d75bd9fef')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
