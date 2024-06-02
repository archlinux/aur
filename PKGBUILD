# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r283.09a288f
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libdrm' 'wayland' 'libappindicator-gtk3' 'gpu-screen-recorder-git')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('7896469b7bf267d23a872869eee7e595a60fe8aad214ec5061aaec5d54afd5f1d1a387e69dbedb953c8eb33757a47f683ae23efba11abc34b373890f309b2c07')

build() {
  cd "$srcdir"
  ./build.sh
  strip gpu-screen-recorder-gtk
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder-gtk" "$pkgdir/usr/bin/gpu-screen-recorder-gtk"
  install -Dm644 "gpu-screen-recorder-gtk.desktop" "$pkgdir/usr/share/applications/com.dec05eba.gpu_screen_recorder.desktop"
  install -Dm644 com.dec05eba.gpu_screen_recorder.appdata.xml "$pkgdir/usr/share/metainfo/com.dec05eba.gpu_screen_recorder.appdata.xml"
  
  install -Dm644 "icons/hicolor/32x32/apps/com.dec05eba.gpu_screen_recorder.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/com.dec05eba.gpu_screen_recorder.png"
  install -Dm644 "icons/hicolor/64x64/apps/com.dec05eba.gpu_screen_recorder.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.dec05eba.gpu_screen_recorder.png"
  install -Dm644 "icons/hicolor/128x128/apps/com.dec05eba.gpu_screen_recorder.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.dec05eba.gpu_screen_recorder.png"

  install -Dm644 "icons/tray_idle.png" "$pkgdir/usr/share/com.dec05eba.gpu_screen_recorder/tray_idle.png"
  install -Dm644 "icons/tray_recording.png" "$pkgdir/usr/share/com.dec05eba.gpu_screen_recorder/tray_recording.png"
  install -Dm644 "icons/tray_paused.png" "$pkgdir/usr/share/com.dec05eba.gpu_screen_recorder/tray_paused.png"
}
