# Maintainer: Sander Boom <sanderboom@gmail.com>
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=2.3.2
pkgrel=2
pkgdesc="PHP_CodeSniffer tokenises PHP, JavaScript and CSS files and detects violations of a defined set of coding standards."
arch=('any')
url="http://pear.php.net/package/PHP_CodeSniffer/"
license=('BSD')
depends=('php')
makedepends=('php-pear')
source=("http://download.pear.php.net/package/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('6ebf4ee75425f27995768ecca70c2846c7f450735f09c5f30013ebecf648ac4d')

package() {
  pear install -P ${pkgdir} ${srcdir}/${_pkgname}-${pkgver}.tgz

  # Remove PEAR channel metadata etc. from the package (which may cause
  # filesystem conflicts), thanks skremiec.
  cd ${pkgdir}/usr/share/pear
  rm -r $(ls -A | grep '^\.')
}
