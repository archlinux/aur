# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
pkgname=phpunit
pkgver=4.8.9
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('ac184ed7aa5ed23c6aaba421a9da5ff8d8cd48175c57f8328b1526a84b6b2423439399e1e4258b0ed415f8807c501a6a66d2a8607c5624876404a37cfab01e20'
            '8cd4a84df128f54ef6cf657d2d6e4307b2f4fe92f60b94f6639c16c2ebcffcb20923fcfee3cf7becddf0e138c5affacb887ac43d356c7ef220f73e6d75bd9fef')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
