# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Co-Maintainer: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpunit

_pkgname=phpunit
pkgname=${_pkgname}
pkgver=5.7.8
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php")
install="${_pkgname}.install"
source=("https://phar.phpunit.de/phpunit-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/phpunit/${pkgver}/LICENSE")
sha512sums=('15f5c49b9ff4b824d221cde2b06ba76ba1d1cd211e89d355992c0ca4011082924f254c73eed23c1435fbfc3dcb4a83e01ee7ed2cfa505cee3a17e932f0f55ee1'
            'a1899db182b9221aca64fd5a8952a56028786f9dbe4db78375d8e59075483b88a58c9cc68124bdaa2ebeb12340490b13cd5732b9e47ae5ed2d12703b6ffead2a')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
