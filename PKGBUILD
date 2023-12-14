# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsextra
_pkgname=PHPCSExtra
pkgver=1.2.1
pkgrel=1
pkgdesc="A collection of sniffs and standards for use with PHP_CodeSniffer."
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSExtra"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-phpcsutils')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('91d1d7d270d16a12476c10274ea85676d49d6e016c7efa0391baa2a476944a48715abf4bea0e25c90bed2f1bf4412344bcb6d7ae234eecdd8953ae04f0984864')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Modernize" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Universal" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/NormalizedArrays" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
