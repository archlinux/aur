# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-wordpress
_pkgname=WordPress-Coding-Standards
pkgver=3.3.0
pkgrel=1
pkgdesc="PHP_CodeSniffer rules (sniffs) to enforce WordPress coding conventions "
arch=('any')
url="https://github.com/WordPress/WordPress-Coding-Standards"
license=('MIT')
depends=('php-codesniffer' 'php-codesniffer-phpcsextra' 'php-codesniffer-phpcsutils')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WordPress/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('57e2ae5b533670979cad2317053e062bbfc11d1ad88a47126f652e8424cf271f5307f78e20800dfe6b955ea47cafa584295aec4397690cb6ab97deda75cc6f1d')

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
