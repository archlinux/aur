# Maintainer: Sander Boom <sanderboom@gmail.com>
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=2.4.0
pkgrel=1
pkgdesc="PHP_CodeSniffer tokenises PHP, JavaScript and CSS files and detects violations of a defined set of coding standards."
arch=('any')
url="http://pear.php.net/package/PHP_CodeSniffer/"
license=('BSD')
depends=('php')
makedepends=('php-pear')
source=("http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('55a9fe753d58a0241294706c433afe2a7d49903d8f7aca6c19ab7f6533147747')

package() {
  pear install -P ${pkgdir} ${srcdir}/${_pkgname}-${pkgver}.tgz

  # Remove PEAR channel metadata etc. from the package (which may cause
  # filesystem conflicts), thanks skremiec.
  cd ${pkgdir}/usr/share/pear
  rm -r $(ls -A | grep '^\.')
}
