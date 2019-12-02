# Maintainer: Sander Boom <sanderboom@gmail.com>
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=3.5.2
pkgrel=1
pkgdesc="PHP_CodeSniffer tokenizes PHP, JavaScript and CSS files to detect and fix violations of a defined set of coding standards."
arch=('any')
url="http://pear.php.net/package/PHP_CodeSniffer/"
license=('BSD')
depends=('php')
source=("phpcs-${pkgver}.phar::https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcs.phar"
        "phpcs-${pkgver}.phar.asc::https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcs.phar.asc"
        "phpcbf-${pkgver}.phar::https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcbf.phar"
        "phpcbf-${pkgver}.phar.asc::https://github.com/squizlabs/${_pkgname}/releases/download/${pkgver}/phpcbf.phar.asc"
        "licence-${pkgver}.txt::https://raw.githubusercontent.com/squizlabs/${_pkgname}/${pkgver}/licence.txt")
validpgpkeys=('A972B9ABB95D0B760B51442231C7E470E2138192')
sha256sums=('15ad1fe73b3e972f666bf4d0e9b51548d4b50f780c9cf0c64999c78c9a4e644f'
            'SKIP'
            'a632465994bb5e17de8722c855c539a45e6e6e1785caf644820144436afd167e'
            'SKIP'
            '821c1697ab88bb71a5d1637743024e455d87074b8a5d0732f85205bd40cba6c9')

package() {
  install -Dm0755 "${srcdir}/phpcs-${pkgver}.phar" "${pkgdir}/usr/bin/phpcs"
  install -Dm0755 "${srcdir}/phpcbf-${pkgver}.phar" "${pkgdir}/usr/bin/phpcbf"

  install -d "${pkgdir}/usr/share/licenses"
  install -D -m 644 "${srcdir}/licence-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/licence.txt"
}
