# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=php-codesniffer-phpcompatibilityparagonie
_pkgname=PHPCompatibilityParagonie
pkgver=1.3.1
pkgrel=1
pkgdesc="PHP CodeSniffer rules (sniffs) to analyse the codebase of a project using either of the Paragonie polyfills."
arch=('any')
url="https://github.com/PHPCompatibility/PHPCompatibilityParagonie"
license=('LGPL')
depends=('php-codesniffer')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b4816b3cf19c3ddd886140bb607e2fceb97ea702a4fc77620560995a898dbcb7')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCompatibilityParagonieRandomCompat"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCompatibilityParagonieRandomCompat/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCompatibilityParagonieSodiumCompat"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCompatibilityParagonieSodiumCompat/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
