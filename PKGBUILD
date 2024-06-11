# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r297.0a428b3
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
sha512sums=('a8f4dfc51ef5914be173c84d695b737837625fd05a5f242370dc4764f6c59e980f0ce1da3fc7f6809c47180a7a2777764161d2dde8a79e9784ec3398a9a982d9')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -v -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
