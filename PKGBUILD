# Maintainer: Sander Boom <sanderboom@gmail.com>
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=3.0.2
pkgrel=1
pkgdesc="PHP_CodeSniffer tokenizes PHP, JavaScript and CSS files to detect and fix violations of a defined set of coding standards."
arch=('any')
url="http://pear.php.net/package/PHP_CodeSniffer/"
license=('BSD')
depends=('php')
source=("https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcs.phar"
        "https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcbf.phar"
        "https://raw.githubusercontent.com/squizlabs/PHP_CodeSniffer/${pkgver}/licence.txt")

sha256sums=('2a76ce406a6e9a2118f757bef439f1c53adae4f12f0ffcd6196f45dd7f530bf9'
            '172aedbe1a7e30022dd2027492ad1fc389e1eaceedcf810ecdedfaf54d8d07f8'
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
