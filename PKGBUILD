# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Marc Straube <email@marcstraube.de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpunit

_pkgname=phpunit
pkgname=${_pkgname}
pkgver=7.2.2
pkgrel=1
pkgdesc="PHPUnit is a programmer-oriented testing framework for PHP."
url="https://phpunit.de"
arch=("any")
license=("BSD")
depends=("php>=7.0.0")
install="${_pkgname}.install"
source=("https://phar.phpunit.de/phpunit-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/phpunit/${pkgver}/LICENSE")
sha512sums=('4f0b4536d674104e0684f5cb6b41ad0f99f3e93541988bbafa3619db8d62b7a27d7ee24f17a431b1ca744c500d9027b8fe7461ce3450613de1e28c09ceb99383'
            'c7a1c74549b1b81aa9e641fd5875ffa8db86c49c435a0c442d9284dab0aa0fecbd9dc7160de1e00d792124595a870aae359509a82dce6f9d4e00eda106266073')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
