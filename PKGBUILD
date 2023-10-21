# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r167.4a9017f
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libdrm' 'wayland' 'gpu-screen-recorder-git')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('d7b7016978b0fb5b56848edb464fd5a199ebf4593abb92024b76a070cbc22b64b743a284ec624026c4a73013727339668db5692a8bd2e04c99b5e23ac521cb77')

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
