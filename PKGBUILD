# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=php-codesniffer-phpcompatibility
_pkgname=PHPCompatibility
pkgver=9.3.5
pkgrel=1
pkgdesc="PHP CodeSniffer rules (sniffs) that checks for PHP cross-version compatibility."
arch=('any')
url="https://github.com/PHPCompatibility/PHPCompatibility"
license=('LGPL')
depends=('php-codesniffer')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('578c7f18e098b0a91df42273d28c68f36114b25161ee161a6d893cbfb7ad42e1')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/PHPCompatibility"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCompatibility/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  cp --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/PHPCSAliases.php" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
