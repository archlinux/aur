# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=playmymusic
pkgver=2.2.0
pkgrel=1
pkgdesc="Melody is a music player for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="http://anufrij.org/melody/"
license=(GPL3)
depends=(libgranite.so libsoup gst-plugins-base gst-plugins-good taglib gtk3)
makedepends=(meson vala)
optdepends=('gst-plugins-bad: "Bad" plugin libraries'
            'gst-plugins-ugly: "Ugly" plugin libraries')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/artemanufrij/playmymusic/archive/${pkgver}.tar.gz")
sha256sums=('810a038980f579a11314cb88c9c048838b88d9f6fc9132ee146323170027d866')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
