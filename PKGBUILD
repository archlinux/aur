# Maintainer: Frank Vanderham <twelveeighty[at]gmail[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-bufexplorer
pkgver=7.14.0
pkgrel=1
pkgdesc='Simple buffer list/switcher for vim'
url='https://github.com/jlanzarotta/bufexplorer'
arch=(any)
license=(BSD-3-Clause)
depends=(
  vim-plugin-runtime
)
source=(https://github.com/jlanzarotta/bufexplorer/archive/refs/tags/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('44088a66e6044da153ffea8e65cde8666f04c7aa79778f746c5bae112c5b49dd73c1c5db706a1542ef06a8d601b3c9856af8ccf6ab98bc96486ee2d709d6169e')
b2sums=('1a5ab24d6f528e8051fe28766a602c8760863ec03ee7250a96c95aaf4533487cacc57f4ca022fd8f72b1fa8b9ca8aaec040b8ef47b7777ca11377f01f347a7a7')

package() {
  cd bufexplorer-${pkgver}
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm 644 doc/* -t "${installpath}/doc"
  install -Dm 644 plugin/* -t "${installpath}/plugin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
