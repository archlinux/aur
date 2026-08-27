# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-phpcompatibilityparagonie
_pkgname=PHPCompatibilityParagonie
pkgver=1.3.4
pkgrel=1
pkgdesc="PHP CodeSniffer rules (sniffs) to analyse the codebase of a project using either of the Paragonie polyfills."
arch=('any')
url="https://github.com/PHPCompatibility/PHPCompatibilityParagonie"
license=('LGPL')
depends=('php-codesniffer')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d309841fea7dd954966e700dcbda725e007a9080c6d843ab27ca0d83d1d290c4')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCompatibilityParagonieRandomCompat"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCompatibilityParagonieRandomCompat/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCompatibilityParagonieSodiumCompat"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCompatibilityParagonieSodiumCompat/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
