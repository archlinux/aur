# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Co-Maintainer: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=phpunit
pkgver=5.2.0
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('fde622b4053d48142fc275c6efd7f565471251bd89a90556e5711f5926fbd7807bdff9022900bcd7f9d7f189ac7863005d39a13cb6b692e9c6ee4afa50a444e0'
            '62e7d1d00af9db6ef5d2ba79a8039f4df2d00ef8124678b4c56d94e69e210e0e74e2f2156e469c57c1e24354cbd3a8ae97059917e364aaa52e9892f814adede3')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
