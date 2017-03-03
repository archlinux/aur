# Maintainer: Sander Boom <sanderboom@gmail.com>
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=2.8.1
pkgrel=1
pkgdesc="PHP_CodeSniffer tokenizes PHP, JavaScript and CSS files to detect and fix violations of a defined set of coding standards."
arch=('any')
url="http://pear.php.net/package/PHP_CodeSniffer/"
license=('BSD')
depends=('php')
source=("https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcs.phar"
        "https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcbf.phar"
        "https://raw.githubusercontent.com/squizlabs/PHP_CodeSniffer/${pkgver}/licence.txt")

sha256sums=('fe79886e2cb4f7f60e78d57eb63c77f5018876f33e489ce66c6546e6422afd5c'
            'f0d0fdcc07a2e3bc8520829318728118116c430505f23619e08b62a0ce132ae1'
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
