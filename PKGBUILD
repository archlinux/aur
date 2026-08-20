# Maintainer: Network Jack <Network_Jack@null.net>
pkgname=obs-streamfx-bin
pkgver=0.12.0b372
pkgrel=1
pkgdesc="Bring your stream back to life with modern effects! (Binaries)"
arch=("x86_64" "x86_64_v3")
url="https://github.com/InspecteurKepler/obs-StreamFX-free"
license=('GPL')
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11"
         "qt6-base" "curl" "gtk-update-icon-cache"
         "obs-studio>=29" "nlohmann-json")
provides=('obs-streamfx')
conflicts=('obs-streamfx' 'obs-streamfx-git' 'obs-streamfx-unstable')
source=("https://github.com/InspecteurKepler/obs-StreamFX-free/releases/download/${pkgver}/streamfx--0.12.0b372-g40807170-Clang.7z")
sha256sums=('4aeff24b6c7aab6620c0d6bb34129c8df2649889274fce9213d1365310bde610')

package() {
  cd "plugins"
  
  install -D -m 755 StreamFX/bin/64bit/StreamFX.so "${pkgdir}/usr/lib/obs-plugins/StreamFX.so"
  
  mkdir -p "$pkgdir"/usr/share/obs/obs-plugins/StreamFX
  cp -R StreamFX/data/* "$pkgdir"/usr/share/obs/obs-plugins/StreamFX
  chmod u=rwX,g=rX,o=rX "$pkgdir"/usr/share/obs/obs-plugins/StreamFX/*/**/*
}
