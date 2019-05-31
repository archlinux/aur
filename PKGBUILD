# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=gxplugins-lv2
pkgver=0.7
pkgrel=1
pkgdesc="A set of guitar pedal simulation LV2 plugins from the guitarix project."
arch=('i686' 'x86_64')
url="https://github.com/brummer10/GxPlugins.lv2"
license=('GPL3')
groups=('lv2-plugins')
depends=('gtkmm')
makedepends=('lv2' 'libxext' 'freetype2')
source=("https://github.com/brummer10/GxPlugins.lv2/releases/download/v${pkgver}/GxPlugins_${pkgver}.tar.gz")
md5sums=('05d739339bd48311b1e9590232780809')


build() {
  cd "${srcdir}/GxPlugins_${pkgver}"
  make
}

package() {
  cd "${srcdir}/GxPlugins_${pkgver}"
  make DESTDIR="${pkgdir}" INSTALL_DIR=/usr/lib/lv2 install
}
