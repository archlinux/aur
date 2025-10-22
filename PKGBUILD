# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-wordpress
_pkgname=WordPress-Coding-Standards
pkgver=3.2.0
pkgrel=1
pkgdesc="PHP_CodeSniffer rules (sniffs) to enforce WordPress coding conventions "
arch=('any')
url="https://github.com/WordPress/WordPress-Coding-Standards"
license=('MIT')
depends=('php-codesniffer' 'php-codesniffer-phpcsextra' 'php-codesniffer-phpcsutils')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WordPress/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('53a8517b567a4b477594a32ce9facc30c30d04c0a56248fd0852dbc10da88b9444fad285ffe611dfab8be013572af2e1430c7ff2be48ed639407e08ba7951cff')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WordPress"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/WordPress/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WordPress-Core"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/WordPress-Core/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WordPress-Docs"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/WordPress-Docs/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WordPress-Extra"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/WordPress-Extra/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
