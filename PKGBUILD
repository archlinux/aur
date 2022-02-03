# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=php-codesniffer-woocommerce
_pkgname=woocommerce-sniffs
pkgver=0.1.2
pkgrel=1
pkgdesc="PHP CodeSniffer rules (sniffs) for WooCommerce."
arch=('any')
url="https://github.com/woocommerce/woocommerce-sniffs"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-wordpress' 'php-codesniffer-phpcompatibilitywp')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5e149616b2d2b21dfdb24833b0ee1eb3e6224ff86f5c702a2568e8727f488493')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WooCommerce"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/src/WooCommerce/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WooCommerce-Core"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/src/WooCommerce-Core/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
