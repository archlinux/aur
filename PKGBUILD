# Maintainer Max <max@swk-web.com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

_pkgname=phpunit
pkgname=${_pkgname}-bin
pkgver=12.1.4
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
provides=('phpunit')
conflicts=('phpunit')
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php>=8.1.0")
install="${_pkgname}.install"
source=("https://phar.phpunit.de/phpunit-${pkgver}.phar"
        "https://phar.phpunit.de/phpunit-${pkgver}.phar.asc"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/sebastianbergmann/phpunit/${pkgver}/LICENSE")
# To add the key use gpg
#  gpg --keyserver pgp.uni-mainz.de --recv-keys 4AA394086372C20A
validpgpkeys=('D8406D0D82947747293778314AA394086372C20A')
sha256sums=('4b4152817486715fd915675117c9dc270554827b2b27e52ff45741a1fd84406a'
            'SKIP'
            '9b6785c0feb16684277fe650a56d359ce4ec139fb4ae50d3617238be281386e5')

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
