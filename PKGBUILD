# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r116.c21b38b
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'gpu-screen-recorder-git')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('a211ee8222b048cdfa7fbdc15ca9d776f25e519d0760f46978faebba8b617ce6c9ebc2a4f489b694ea48d544c6df2b7f311ad629b7108c9f46b4d0832d1bab46')

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
