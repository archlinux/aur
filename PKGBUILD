# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=pdepend
pkgver=2.2.0
pkgrel=1
pkgdesc="A tool for PHP software metrics"
url="http://pdepend.org/"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("http://static.pdepend.org/php/${pkgver}/pdepend.phar"
        "https://raw.githubusercontent.com/pdepend/pdepend/${pkgver}/LICENSE"
        "pdepend.install")
sha512sums=('3bb9b95f9ce53245dcefa9f3d4d2dd5d2a685ca25a409c0ee151a917116f9445eab33c7e131324054d52905de99c3a23d78f9551af52ccfe6a7eea2dc7e222e8'
            'e77faa58731d21b1f55523f8aec955043ba383f472a76b5cfb5994a6cdfdf3dc63d3a329b50754ab9ff0ab869920bc38a58b3688bf37d3cddac22585b917c2d9'
            '0f51b813c69db50f985a4c168c17623e5cdf792aaa1c5f73e238945d7c979486f7fb95584e11eaf6ea6e67ba675c6f489a97e32328ac9c05974adc5534286403')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/pdepend.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/pdepend"
}
