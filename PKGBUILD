# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Please report issues at https://github.com/sanduhrs/arch-aur-phploc

pkgname=phploc
pkgver=4.0.0
pkgrel=2
pkgdesc="A tool for quickly measuring the size of a PHP project"
url="https://github.com/sebastianbergmann/phploc"
arch=("any")
license=("BSD")
depends=("php")
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('35f50ed09d458f60d756824c208dca8024dc81967f1586cc682cdf464217fd830aa93c49a67ec78ae3c004d50b28ba242f44acfcda8451d9ce9a29b25dce813a'
            'c5dec54e82d5989860ccfbd5ea0c5f0b7b0331531f1d5d7a409903315cca7a2be72296bd4e2166c44fabe8ded48b22a154c9dcd5c0cde0ce91587fcb90a7b506')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
