# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsextra
_pkgname=PHPCSExtra
pkgver=1.4.1
pkgrel=1
pkgdesc="A collection of sniffs and standards for use with PHP_CodeSniffer."
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSExtra"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-phpcsutils')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('fcdb24b49d6243fef38c3d033794f9b5e7bcef568703185c8db356d67779ecd4c024364c042a70727867d6e4428441ac874439605f26b043553a87d835e917b1')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Modernize" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Universal" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/NormalizedArrays" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
