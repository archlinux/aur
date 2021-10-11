# Maintainer Max <max@swk-web.com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

_pkgname=phpunit
pkgname=${_pkgname}
pkgver=9.5.10
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php>=7.0.0")
install="${_pkgname}.install"
source=("https://phar.phpunit.de/phpunit-${pkgver}.phar"
        "https://phar.phpunit.de/phpunit-${pkgver}.phar.asc"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/sebastianbergmann/phpunit/${pkgver}/LICENSE")
# To add the key use gpg
#  gpg --keyserver pgp.uni-mainz.de --recv-keys 4AA394086372C20A
validpgpkeys=('D8406D0D82947747293778314AA394086372C20A')
sha256sums=('a34b9db21de3e75ba2e609e68a4da94633f4a99cad8413fd3731a2cd9aa08ca8'
            'SKIP'
            '678ce98aa2b4ef04956b79731a07db2845d59aa43794cd9b4c913e0e6d7172d9')

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
