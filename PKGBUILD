# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r295.5710cb1
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libdrm' 'wayland' 'libayatana-appindicator' 'gpu-screen-recorder-git')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('8c0f743a77d731a7fb9434e755d56518198ee1f17c916987e95fb24983e8985b4e6f83f10288fae7f3812d88de555511844a7bc4ada836348fbd3e2c0ab47bfd')

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
  
  install -Dm644 "icons/hicolor/32x32/status/com.dec05eba.gpu_screen_recorder.tray-idle.png" "$pkgdir/usr/share/icons/hicolor/32x32/status/com.dec05eba.gpu_screen_recorder.tray-idle.png"
  install -Dm644 "icons/hicolor/32x32/status/com.dec05eba.gpu_screen_recorder.tray-recording.png" "$pkgdir/usr/share/icons/hicolor/32x32/status/com.dec05eba.gpu_screen_recorder.tray-recording.png"
  install -Dm644 "icons/hicolor/32x32/status/com.dec05eba.gpu_screen_recorder.tray-paused.png" "$pkgdir/usr/share/icons/hicolor/32x32/status/com.dec05eba.gpu_screen_recorder.tray-paused.png"
  install -Dm644 "icons/hicolor/32x32/apps/com.dec05eba.gpu_screen_recorder.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/com.dec05eba.gpu_screen_recorder.png"

  install -Dm644 "icons/hicolor/64x64/status/com.dec05eba.gpu_screen_recorder.tray-idle.png" "$pkgdir/usr/share/icons/hicolor/64x64/status/com.dec05eba.gpu_screen_recorder.tray-idle.png"
  install -Dm644 "icons/hicolor/64x64/status/com.dec05eba.gpu_screen_recorder.tray-recording.png" "$pkgdir/usr/share/icons/hicolor/64x64/status/com.dec05eba.gpu_screen_recorder.tray-recording.png"
  install -Dm644 "icons/hicolor/64x64/status/com.dec05eba.gpu_screen_recorder.tray-paused.png" "$pkgdir/usr/share/icons/hicolor/64x64/status/com.dec05eba.gpu_screen_recorder.tray-paused.png"
  install -Dm644 "icons/hicolor/64x64/apps/com.dec05eba.gpu_screen_recorder.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.dec05eba.gpu_screen_recorder.png"

  install -Dm644 "icons/hicolor/128x128/status/com.dec05eba.gpu_screen_recorder.tray-idle.png" "$pkgdir/usr/share/icons/hicolor/128x128/status/com.dec05eba.gpu_screen_recorder.tray-idle.png"
  install -Dm644 "icons/hicolor/128x128/status/com.dec05eba.gpu_screen_recorder.tray-recording.png" "$pkgdir/usr/share/icons/hicolor/128x128/status/com.dec05eba.gpu_screen_recorder.tray-recording.png"
  install -Dm644 "icons/hicolor/128x128/status/com.dec05eba.gpu_screen_recorder.tray-paused.png" "$pkgdir/usr/share/icons/hicolor/128x128/status/com.dec05eba.gpu_screen_recorder.tray-paused.png"
  install -Dm644 "icons/hicolor/128x128/apps/com.dec05eba.gpu_screen_recorder.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.dec05eba.gpu_screen_recorder.png"
}
