# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=playmyvideos
pkgver=1.1.0
pkgrel=2
pkgdesc="Cinema is a video player for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="http://anufrij.org/cinema"
license=(GPL3)
depends=(libgranite.so gtk3 clutter-gtk clutter-gst gst-plugins-base sqlite)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/playmyvideos/archive/${pkgver}.tar.gz")
sha256sums=('b3f24c7c1dd2d561ee3e486476385a7e5c8e6a516cb570c444011a8ee2eada91')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
