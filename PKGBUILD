# Maintainer: Jager1win jagerwin@ya.ru
pkgname=gucli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Your personal command center in the system tray"
arch=('x86_64')
url="https://github.com/jager1win/gucli"
license=('GPL-3.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator-glib' 'libnotify')
install="gucli.install"
source=(
  "gucli::${url}/releases/download/v${pkgver}/gucli"
  "gucli.desktop"
  "512x512.png::${url}/raw/main/src-tauri/icons/512x512.png"
  "256x256.png::${url}/raw/main/src-tauri/icons/256x256.png"
  "128x128.png::${url}/raw/main/src-tauri/icons/128x128.png"
  "64x64.png::${url}/raw/main/src-tauri/icons/64x64.png"
  "48x48.png::${url}/raw/main/src-tauri/icons/48x48.png"
  "32x32.png::${url}/raw/main/src-tauri/icons/32x32.png"
  "24x24.png::${url}/raw/main/src-tauri/icons/24x24.png"
  "16x16.png::${url}/raw/main/src-tauri/icons/16x16.png"
)
sha256sums=('ed78be9c5bd6614faac9b0957d04b8a4d3be6688b6508693eabbc6c1894fdcff'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


package() {
  # Install binary
  install -Dm755 "gucli" "${pkgdir}/usr/bin/gucli"
  
  # Install desktop file
  install -Dm644 "gucli.desktop" "${pkgdir}/usr/share/applications/gucli.desktop"
  
  # Install icons
  for icon_size in 16 24 32 48 64 128 256 512; do
    if [[ -f "${icon_size}x${icon_size}.png" ]]; then
      install -Dm644 "${icon_size}x${icon_size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/gucli.png"
    fi
  done
}
