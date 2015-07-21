# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
pkgname=phpunit
pkgver=4.7.7
pkgrel=2
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE"
        "${pkgname}.install")
sha512sums=('984e73690a20697614d776c336e32bef3cb5eb03a3fcd8d83cae16e08598cc074197fce45e2f1307be11b53927fc3863d5f0a7d603f3ec6ecdd50b77cc71b6a7'
            '8cd4a84df128f54ef6cf657d2d6e4307b2f4fe92f60b94f6639c16c2ebcffcb20923fcfee3cf7becddf0e138c5affacb887ac43d356c7ef220f73e6d75bd9fef'
            '62dad27e8e16a9d11096b133388439c46f8a2c474c09b70797471cde69de3bb304fc8e987548ae00a28b2fe8f4b6d50597c511cbbeed7d32f03833801dcfd9a9')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
