# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=playmymusic
pkgver=1.0.1
pkgrel=1
pkgdesc="Melody is a music player for Pantheon, developed by Artem Anufrij"
arch=('x86_64')
url="http://anufrij.org/melody/"
license=('GPL3')
depends=('libgranite.so' 'libsoup' 'gst-plugins-base-libs' 'taglib' 'gtk3')
makedepends=('meson' 'vala')
optdepends=('gst-plugins-base: "Base" plugin libraries'
            'gst-plugins-good: "Good" plugin libraries'
            'gst-plugins-bad: "Bad" plugin libraries'
            'gst-plugins-ugly: "Ugly" plugin libraries')
source=("https://github.com/artemanufrij/playmymusic/archive/${pkgver}.tar.gz")
sha256sums=('1e7e1dd9df44d46e6148c75636cb76e3944b38d0f8b868a2dee83c832e677355')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
