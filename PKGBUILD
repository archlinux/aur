# Maintainer Max <max@swk-web.com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

_pkgname=phpunit
pkgname=${_pkgname}-bin
pkgver=13.0.3
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
sha256sums=('4a27beb6d1f84934d1f49abfb575fb9f5bf29a0dc3df81018845f20b179d323f'
            'SKIP'
            '5aa383bf44a3951bb4a2214c740a96e7795e473e1a0abc8d5812e6a3c1dbfc1e')

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
