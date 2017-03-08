# Maintainer: Sýlvan Heuser <sylvan.heuser@gmx.net>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

_pkgname=phpunit
pkgname=${_pkgname}5
pkgver=5.7.14
pkgrel=2
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP. This is the old stable version"
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php")
provides=("phpunit=${pkgver}")
conflicts=("phpunit")
install="${_pkgname}.install"
source=("https://phar.phpunit.de/phpunit-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/phpunit/${pkgver}/LICENSE")
sha512sums=('57bb297f08929af60b56dba6ca90642a4d403a883c06687d23901c8742510cb209a80d704272ace498db1891fb4bf40127b47b7ccf12b319bd2fe5acd0e07b2f'
            'a1899db182b9221aca64fd5a8952a56028786f9dbe4db78375d8e59075483b88a58c9cc68124bdaa2ebeb12340490b13cd5732b9e47ae5ed2d12703b6ffead2a')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
