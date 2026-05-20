# Maintainer: lizapropanol <lizapropanol@github.com>
pkgname=morph
pkgver=0.2.1
pkgrel=1
pkgdesc="Modern music player with dynamic UI and QML theme support"
arch=('x86_64')
url="https://github.com/lizapropanol/morph"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-svg' 'qt6-5compat' 
         'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'hicolor-icon-theme' 'yt-dlp' 'ffmpeg')
makedepends=('cmake' 'gcc')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dedb024e01ca269db35b55548d6795c4f438e77701456a8284969b11a3f03df8')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
