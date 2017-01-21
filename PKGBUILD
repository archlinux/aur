# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=gxplugins-lv2
pkgver=0.1
pkgrel=1
pkgdesc="A set of guitar pedal simulation LV2 plugins from the guitarix project."
arch=('i686' 'x86_64')
url="https://github.com/brummer10/GxPlugins.lv2"
license=('GPL3')
groups=('lv2-plugins')
depends=('gtk2')
makedepends=('lv2' 'libxext' 'freetype2')
source=('https://github.com/brummer10/GxPlugins.lv2/releases/download/v0.1/GxPlugins.zip')
md5sums=('f9595646c677e32c541a09d9ee49c016')


build() {
  cd "${srcdir}/GxPlugins.lv2"
  make INSTALL_DIR=/usr/lib/lv2
}

package() {
  cd "${srcdir}/GxPlugins.lv2"
  make DESTDIR="${pkgdir}" INSTALL_DIR=/usr/lib/lv2 install
}

