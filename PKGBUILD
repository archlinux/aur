# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=pdepend
pkgver=2.1.0
pkgrel=2
pkgdesc="A tool for PHP software metrics"
url="http://pdepend.org/"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("http://static.pdepend.org/php/${pkgver}/pdepend.phar"
        "https://raw.githubusercontent.com/pdepend/pdepend/${pkgver}/LICENSE"
        "pdepend.install")
sha512sums=('8d3e5f5992dc7d0f5708a1224229492e751af56a9d359580d6a942ce6c38ca92a9bc2630d60f48d9cb128952aecfa7b37fc925885e5f4b5bfb4a3b74b0c92f8f'
            'e77faa58731d21b1f55523f8aec955043ba383f472a76b5cfb5994a6cdfdf3dc63d3a329b50754ab9ff0ab869920bc38a58b3688bf37d3cddac22585b917c2d9'
            '0f51b813c69db50f985a4c168c17623e5cdf792aaa1c5f73e238945d7c979486f7fb95584e11eaf6ea6e67ba675c6f489a97e32328ac9c05974adc5534286403')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/pdepend.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/pdepend"
}
