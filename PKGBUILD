# Maintainer: Sander Boom <sanderboom@gmail.com>
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=2.6.1
pkgrel=2
pkgdesc="PHP_CodeSniffer tokenizes PHP, JavaScript and CSS files to detect and fix violations of a defined set of coding standards."
arch=('any')
url="http://pear.php.net/package/PHP_CodeSniffer/"
license=('BSD')
depends=('php')
source=("https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcs.phar"
        "https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcbf.phar"
        "https://raw.githubusercontent.com/squizlabs/PHP_CodeSniffer/${pkgver}/licence.txt")

sha256sums=('cfa9d7e670682aafdaef4be7c8e1a3f01440f784a8e350a655114070339a6255'
            'b381189022a2bb020bd927b1e3fd1d4b2f644742fe78d44ca8b4856b2445b606'
            '821c1697ab88bb71a5d1637743024e455d87074b8a5d0732f85205bd40cba6c9')

package() {
  install -d "${pkgdir}/usr/share/webapps/bin"
  install -D -m 755 "${srcdir}/phpcs.phar" "${pkgdir}/usr/share/webapps/bin/phpcs.phar"
  install -D -m 755 "${srcdir}/phpcbf.phar" "${pkgdir}/usr/share/webapps/bin/phpcbf.phar"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/phpcs.phar" "${pkgdir}/usr/bin/phpcs"
  ln -s "/usr/share/webapps/bin/phpcbf.phar" "${pkgdir}/usr/bin/phpcbf"

  install -d "${pkgdir}/usr/share/licenses"
  install -D -m 644 "${srcdir}/licence.txt" "${pkgdir}/usr/share/licenses/${pkgname}/licence.txt"
}
