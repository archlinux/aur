# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=playmyvideos
pkgver=1.1.0
pkgrel=1
pkgdesc="Cinema is a video player for Pantheon, developed by Artem Anufrij"
arch=('x86_64')
url="http://anufrij.org/cinema"
license=('GPL3')
depends=('libgranite.so' 'gtk3' 'clutter-gtk' 'clutter-gst' 'gst-plugins-base' 'sqlite')
makedepends=('cmake' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/playmyvideos/archive/${pkgver}.tar.gz")
sha256sums=('96e2733e1ee1b361e80602e1caa28f89507041e6f7fd267bd90e207680867e8d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
