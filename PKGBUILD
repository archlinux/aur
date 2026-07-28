# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsextra
_pkgname=PHPCSExtra
pkgver=1.5.1
pkgrel=1
pkgdesc="A collection of sniffs and standards for use with PHP_CodeSniffer."
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSExtra"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-phpcsutils')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e6eb440499d7aa9a1f492301acd755c6acbf51ee21141176a48da0222c405357fbe1769b2a3fd67f12465f50afd7b1ff80462447bf63f428edb57ad2bdc42073')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Modernize" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Universal" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/NormalizedArrays" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
