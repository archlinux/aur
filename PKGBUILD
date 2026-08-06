# Maintainer: Sander Boom
# Contributor: jarosz

pkgname=php-codesniffer
_pkgname=PHP_CodeSniffer
pkgver=4.0.4
pkgrel=1
pkgdesc="PHP_CodeSniffer tokenizes PHP, JavaScript and CSS files to detect and fix violations of a defined set of coding standards."
arch=('any')
url="https://github.com/PHPCSStandards/PHP_CodeSniffer"
license=('BSD')
depends=('php')
source=("phpcs-${pkgver}.phar::https://github.com/PHPCSStandards/${_pkgname}/releases/download/${pkgver}/phpcs.phar"
        "phpcs-${pkgver}.phar.asc::https://github.com/PHPCSStandards/${_pkgname}/releases/download/${pkgver}/phpcs.phar.asc"
        "phpcbf-${pkgver}.phar::https://github.com/PHPCSStandards/${_pkgname}/releases/download/${pkgver}/phpcbf.phar"
        "phpcbf-${pkgver}.phar.asc::https://github.com/PHPCSStandards/${_pkgname}/releases/download/${pkgver}/phpcbf.phar.asc"
        "licence-${pkgver}.txt::https://raw.githubusercontent.com/PHPCSStandards/${_pkgname}/${pkgver}/licence.txt")
validpgpkeys=('5CB4F778BF9BC4FB67AE511D96E91A992CF22FF4')
sha256sums=('4b010cd21d8bc8a17e2504792e3c77ef8259126f24caf7eafe7eddef1fa871e9'
            'SKIP'
            '0b3b8c5571543e94452f6edec0d7e924b287a64c13b73d8dcf3d25f0ee004948'
            'SKIP'
            'ad489e425c9a48b9fe97b8c11dd5f422606aa72e7726a438cd01ebee22d8ba80')

package() {
  install -Dm0755 "${srcdir}/phpcs-${pkgver}.phar" "${pkgdir}/usr/bin/phpcs"
  install -Dm0755 "${srcdir}/phpcbf-${pkgver}.phar" "${pkgdir}/usr/bin/phpcbf"

  install -d "${pkgdir}/usr/share/licenses"
  install -D -m 644 "${srcdir}/licence-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/licence.txt"
}
