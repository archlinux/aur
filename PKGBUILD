# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcsextra
_pkgname=PHPCSExtra
pkgver=1.3.0
pkgrel=1
pkgdesc="A collection of sniffs and standards for use with PHP_CodeSniffer."
arch=('any')
url="https://github.com/PHPCSStandards/PHPCSExtra"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-phpcsutils')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('9559df362da13c789bb4bb1c106a383c5e8d238eedccf3886ba46ea32214f1aa4db8731c27c5b789b267f7de8efe44d17a9b099179d3b54e90ad0380db83faec')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Modernize" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Universal" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/NormalizedArrays" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
