# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r174.efa4ce6
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libdrm' 'wayland' 'gpu-screen-recorder-git')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('532e6ea3ddc2ac4ef9beb46863b2c017d37db1dc4edaf8213849493271b78774abfb96022b347e2eed5a36acf37f6bcf283671682c56e35ecf60de2f873b6fdc')

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
