# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r171.d2ccfd9
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libdrm' 'wayland' 'gpu-screen-recorder-git')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('e2e9b836e47a6e48eabc6c6959b3de89f80842c819c2e228318796a444a25c1442eb51f26e74ed62c6ea7ddc27ee3aa76e3a2606cc0521a6b1fbbcb8387a696a')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder-gtk" "$pkgdir/usr/bin/gpu-screen-recorder-gtk"
  install -Dm644 "gpu-screen-recorder-gtk.desktop" "$pkgdir/usr/share/applications/com.dec05eba.gpu_screen_recorder.desktop"
  install -Dm644 com.dec05eba.gpu_screen_recorder.appdata.xml "$pkgdir/usr/share/metainfo/com.dec05eba.gpu_screen_recorder.appdata.xml"
  install -Dm644 icons/hicolor/64x64/apps/com.dec05eba.gpu_screen_recorder.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.dec05eba.gpu_screen_recorder.png"
  install -Dm644 icons/hicolor/128x128/apps/com.dec05eba.gpu_screen_recorder.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.dec05eba.gpu_screen_recorder.png"
}
