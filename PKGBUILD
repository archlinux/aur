# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
pkgname=pdepend
pkgver=2.2.4
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
sha512sums=('eedd94c40ee0bed95c319a3249dd1fde9f5481382682d9d7840e04920f550c62926d1d1e15aba40aea5f15349bc10ac49702402c5ed99252b17d0715075d40d7'
            'e77faa58731d21b1f55523f8aec955043ba383f472a76b5cfb5994a6cdfdf3dc63d3a329b50754ab9ff0ab869920bc38a58b3688bf37d3cddac22585b917c2d9'
            '918537da7a6431b3c9c2bfd55dd0e317b586924e65a547c4216b58df1f12081737f12af7f19e81365befd15af1ee26046ad7ca086a3c9bde0466c0d9257cd1ac')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/pdepend.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/pdepend"
}
