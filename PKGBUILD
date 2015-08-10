# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
pkgname=phploc
pkgver=2.1.4
pkgrel=1
pkgdesc="A tool for quickly measuring the size of a PHP project"
url="https://github.com/sebastianbergmann/phploc"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE"
        "${pkgname}.install")
sha512sums=('da082dd6bc3886cd615c876b68117e9cf5d2f1319a61ef84d76b4cb4def2a1e362f366d77a901241cd0dcb8bf8dae4a25ed76b6ee757228606e80e2913307336'
            '380f398cc2c10a9e76d39a8f1ce60e367e39a1b3ac4bedab2d6aae7d964d11554cf40fcad3362f80fa4f43aa255f3fb990eece094d016e0167ebd75ae6d0d277'
            '5144d60d89677bda0dfef947b9a89428393d7cdba926b1b1a790223637d42c2558fb768039b2f00dcf1226eba89f5679902670f07be2add85fa9a0b5fd320538')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
