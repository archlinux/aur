# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r303.30ab9d7
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
sha512sums=('0ae46c10593dead59721cc4d3e607944c24542ff0b229c003713b9e290ed732d4cb46a2fe399801495dafaedf57e85e61c9ad82f77a162e3d1752f8fa80d228c')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -v -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
