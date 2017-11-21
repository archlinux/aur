# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Please report issues at https://github.com/sanduhrs/arch-aur-phploc

pkgname=phploc
pkgver=4.0.1
pkgrel=1
pkgdesc="A tool for quickly measuring the size of a PHP project"
url="https://github.com/sebastianbergmann/phploc"
arch=("any")
license=("BSD")
depends=("php")
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('bf16850dd0d507412a7f581ef21b59993e0a941d7a881756450b55326a6482ead5ab1682793f4901684cd64a5c3400f224488224dd4de5576ff98ef86b7b901f'
            'c5dec54e82d5989860ccfbd5ea0c5f0b7b0331531f1d5d7a409903315cca7a2be72296bd4e2166c44fabe8ded48b22a154c9dcd5c0cde0ce91587fcb90a7b506')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
