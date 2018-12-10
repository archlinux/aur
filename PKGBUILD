# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=playmyvideos
pkgver=1.1.2
pkgrel=1
pkgdesc="Cinema is a video player for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="http://anufrij.org/cinema"
license=(GPL3)
depends=(libgranite.so gtk3 clutter-gtk clutter-gst gst-plugins-base sqlite)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/playmyvideos/archive/${pkgver}.tar.gz")
sha256sums=('3693045cf3d4071400edcec1c6b827e185bf54a3cd135188cbbb756fca7ecb5a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
