# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk
pkgver=r419.1720168
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL-3.0-only')
makedepends=('meson' 'gtk-update-icon-cache' 'desktop-file-utils')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libayatana-appindicator' 'gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('746dcba065d0c3fb26126848cd58eb4bd67591bfaad77bb978ca83f427719f0498b1a0f0cbf0e929e4c1441a0e31ac42ac187a97dada670e471b0bb3cd317903')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
