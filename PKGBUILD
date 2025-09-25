# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=php-codesniffer-woocommerce
_pkgname=woocommerce-sniffs
pkgver=1.0.1
pkgrel=1
pkgdesc="PHP CodeSniffer rules (sniffs) for WooCommerce."
arch=('any')
url="https://github.com/woocommerce/woocommerce-sniffs"
license=('LGPL')
depends=('php-codesniffer' 'php-codesniffer-wordpress' 'php-codesniffer-phpcompatibilitywp')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('13a4736e7735bc913d8d1ed74ca0489acd95980a0bff20ee219e756a67af382b0aab20d3a8ae85c7416dc965f4211fe2323785c5d3b9b3234dc6be00debcd2fd')

package() {
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WooCommerce"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/src/WooCommerce/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
  install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/WooCommerce-Core"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/src/WooCommerce-Core/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}

# vim:set ts=2 sw=2 et:
