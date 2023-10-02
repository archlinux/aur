# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-woocommerce
_pkgname=woocommerce-sniffs
pkgver=1.0.0
pkgrel=1
pkgdesc="PHP CodeSniffer rules (sniffs) for WooCommerce."
arch=('any')
url="https://github.com/woocommerce/woocommerce-sniffs"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-wordpress' 'php-codesniffer-phpcompatibilitywp')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('a4bb34bd2327f9d7d3aa47ecec77fd23c719c6e4a117e0a1ecf3fa652f4fd8e3e3b86fe0a4f2ee3fc0b4e63cea0864adde4378610f7ee5b6cc23956db260c524')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WooCommerce"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/src/WooCommerce/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WooCommerce-Core"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/src/WooCommerce-Core/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
