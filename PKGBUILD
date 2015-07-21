# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
pkgname=phploc
pkgver=2.1.3
pkgrel=2
pkgdesc="A tool for quickly measuring the size of a PHP project"
url="https://github.com/sebastianbergmann/phploc"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE"
        "${pkgname}.install")
sha512sums=('362d7f1cd39855847a9d532e7c349abcd68c21f9681445c7cd7ae117add32b1641f380e20b38ddee1f0da4c4e4a4596d9c963aeaca896cf2a2afab606b7bcedd'
            '380f398cc2c10a9e76d39a8f1ce60e367e39a1b3ac4bedab2d6aae7d964d11554cf40fcad3362f80fa4f43aa255f3fb990eece094d016e0167ebd75ae6d0d277'
            '5144d60d89677bda0dfef947b9a89428393d7cdba926b1b1a790223637d42c2558fb768039b2f00dcf1226eba89f5679902670f07be2add85fa9a0b5fd320538')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
