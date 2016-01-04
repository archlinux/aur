# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
pkgname=phploc
pkgver=2.1.5
pkgrel=2
pkgdesc="A tool for quickly measuring the size of a PHP project"
url="https://github.com/sebastianbergmann/phploc"
arch=("any")
license=("BSD")
depends=("php")
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('99f5fe35a78b6a333fda0d38779ece0d3cb83fa9e3f858869d8c1047beb076042cbe246b52d8c46978ab24027fbe585bb1d60a8b07fae555939108f03ac30123'
            '380f398cc2c10a9e76d39a8f1ce60e367e39a1b3ac4bedab2d6aae7d964d11554cf40fcad3362f80fa4f43aa255f3fb990eece094d016e0167ebd75ae6d0d277')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
