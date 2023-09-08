# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsextra
_pkgname=PHPCSExtra
pkgver=1.1.1
pkgrel=1
pkgdesc="A collection of sniffs and standards for use with PHP_CodeSniffer."
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSExtra"
license=('LGPL')
depends=('php-codesniffer')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a555e4cdb46e9b9ddcc82ca856f4d2a51091c3cc5d5680785f607ba97936a0ed')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Modernize" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Universal" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/NormalizedArrays" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
