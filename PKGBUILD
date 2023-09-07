# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-wordpress
_pkgname=WordPress-Coding-Standards
pkgver=3.0.0
pkgrel=1
pkgdesc="PHP_CodeSniffer rules (sniffs) to enforce WordPress coding conventions "
arch=('any')
url="https://github.com/WordPress/WordPress-Coding-Standards"
license=('MIT')
depends=('php-codesniffer' 'php-codesniffer-phpcsextra' 'php-codesniffer-phpcsutils')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WordPress/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('3e32d8b9eec1a639638a0d9b0de00942d2c448577a7e618601102c622126777d')

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
