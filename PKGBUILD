# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpunit

_pkgname=phpunit
pkgname=${_pkgname}
pkgver=9.4.3
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php>=7.0.0")
install="${_pkgname}.install"
source=("https://phar.phpunit.de/phpunit-${pkgver}.phar"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/sebastianbergmann/phpunit/${pkgver}/LICENSE")
sha256sums=('208bd799e935bf6690b103f4e3765f2200b486e8ccc4756f4818d2547a6b326e'
            'SKIP')
sha512sums=('SKIP'
            '8e9e4a876a6b08ad44a60599ad23b3fad5b827925121f2daa427c4a682c6dd2b535151f3cf4f866231722bfb09866f1559fc3e82757a4e64405393ef7e0382cc')

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
