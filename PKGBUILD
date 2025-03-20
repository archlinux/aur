# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk
pkgver=r480.3532d9c
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL-3.0-only')
makedepends=('meson' 'gtk-update-icon-cache' 'desktop-file-utils')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libayatana-appindicator' 'gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('eb1ab46baf6f2734d53923d1ec4c0ebf7ffb0f4716a3563e17960e81fe2c3cdb82a13b7298d50f90805fcebc51164149576dda95c81039b47d8029e4471d3c7b')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
