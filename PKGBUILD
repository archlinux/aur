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
md5sums=('4304b744b31f44d5f476b2654caaade5'
         '9efd7ec2636b1412c93a29f62c9a4e0b'
         '4b2b590f00765d9abdeebe5b0a100ed8')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
