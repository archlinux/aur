# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r302.3a637aa
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
makedepends=('meson')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libdrm' 'wayland' 'libayatana-appindicator' 'gpu-screen-recorder-git')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('f3232e89e34b94b11589e7e7df41b13bf0d2e0bc80eb9f960f1c3dd7bb5419604bb4536749bee242efe42536a18b8356fa43958c94f1f4a34f6cda3faae9d9d1')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -v -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
