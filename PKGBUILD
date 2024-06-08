# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r286.1fee0af
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libdrm' 'wayland' 'libayatana-appindicator' 'gpu-screen-recorder-git')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('ec6066f54256dda8276bfe078bb5d1e5d634d18ca1cc2fc35685dda1b843076d42a0c765c1feb49caadb38bc32fc8caa1535e45c48d766f36e5b185ecc07ab71')

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
