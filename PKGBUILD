# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk
pkgver=r468.1f0063e
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL-3.0-only')
makedepends=('meson' 'gtk-update-icon-cache' 'desktop-file-utils')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libayatana-appindicator' 'gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('1dfe0931a463af61f7e65c44a339fc5c2c33cc557699927e071b8e67d109451bac836977a308d7f1675ee47f87618a0f9b11e6beb51012a0ae8bce6f2c65f73b')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
