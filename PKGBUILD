# Maintainer: Sander Boom <sanderboom@gmail.com>
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=3.5.4
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
sha256sums=('fa518bd3ef9a365110d1a4dea541b9e70c2b658992db1147c37ebcd87b5b3ed3'
            'SKIP'
            '993aef39bd26f2aa038d691d3231d00fa3e3914159c4c077bc41209aca74a7a3'
            'SKIP'
            '821c1697ab88bb71a5d1637743024e455d87074b8a5d0732f85205bd40cba6c9')

package() {
  install -Dm0755 "${srcdir}/phpcs-${pkgver}.phar" "${pkgdir}/usr/bin/phpcs"
  install -Dm0755 "${srcdir}/phpcbf-${pkgver}.phar" "${pkgdir}/usr/bin/phpcbf"

  install -d "${pkgdir}/usr/share/licenses"
  install -D -m 644 "${srcdir}/licence-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/licence.txt"
}
