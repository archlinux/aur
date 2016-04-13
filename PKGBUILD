# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Co-Maintainer: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpunit

_pkgname=phpunit
pkgname=${_pkgname}
pkgver=5.3.2
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php")
install="${_pkgname}.install"
source=("https://phar.phpunit.de/phpunit-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/phpunit/${pkgver}/LICENSE")
sha512sums=('cd59a68b029ba39da99edf298b42bc110ec3141c0e91135fca1077a0f42108e3786bd2a14dfa51e4685d2428315ebb6cb7a52328b8f8a5a33c65576be846dd92'
            '62e7d1d00af9db6ef5d2ba79a8039f4df2d00ef8124678b4c56d94e69e210e0e74e2f2156e469c57c1e24354cbd3a8ae97059917e364aaa52e9892f814adede3')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
