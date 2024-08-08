# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r359.74ecb8a
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libayatana-appindicator' 'gpu-screen-recorder-git')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('1c69d4fe5a4d19e19e1b0454c8d81ae3cbe4fb1e174523e31800bb3cc2310001b098f5e4f9c7e066461350d057d2ee92f52c8cbe2e654a99c7e32874d5139c2b')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
