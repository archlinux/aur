# Maintainer: Sander Boom <sanderboom@gmail.com>
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=3.4.1
pkgrel=3
pkgdesc="PHP_CodeSniffer tokenizes PHP, JavaScript and CSS files to detect and fix violations of a defined set of coding standards."
arch=('any')
url="http://pear.php.net/package/PHP_CodeSniffer/"
license=('custom')
depends=('php')
source=("phpcs-${pkgver}.phar::https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcs.phar"
        "phpcs-${pkgver}.phar.asc::https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcs.phar.asc"
        "phpcbf-${pkgver}.phar::https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcbf.phar"
        "phpcbf-${pkgver}.phar.asc::https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcbf.phar.asc"
        "licence-${pkgver}.txt::https://raw.githubusercontent.com/squizlabs/${_pkgname}/${pkgver}/licence.txt")
validpgpkeys=('A972B9ABB95D0B760B51442231C7E470E2138192')
sha256sums=('805e214829bb79139c1fa260c0fbce5e26a9178dec8d5d79b65c01af2b92fc1f'
            'SKIP'
            '9bb55fe7bf231535e046d7711484d7d7c3d7b0b831ec4a8697aea6c1fed34e14'
            'SKIP'
            '821c1697ab88bb71a5d1637743024e455d87074b8a5d0732f85205bd40cba6c9')

package() {
  install -d "${pkgdir}/usr/share/webapps/bin"
  install -D -m 755 "${srcdir}/phpcs-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/phpcs.phar"
  install -D -m 755 "${srcdir}/phpcbf-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/phpcbf.phar"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/phpcs.phar" "${pkgdir}/usr/bin/phpcs"
  ln -s "/usr/share/webapps/bin/phpcbf.phar" "${pkgdir}/usr/bin/phpcbf"

  install -d "${pkgdir}/usr/share/licenses"
  install -D -m 644 "${srcdir}/licence-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/licence.txt"
}
