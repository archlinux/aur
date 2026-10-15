# Maintainer: rDev <proshiv85@gmail.com>
pkgname=kvant
pkgver=0.2.0
pkgrel=1
pkgdesc='A clean Material 3 audio player'
arch=('x86_64' 'aarch64')
url='https://github.com/proshiv85-byte/kvant'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'taglib' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja')
optdepends=('qt6-multimedia-ffmpeg: FFmpeg playback backend (recommended)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('977a1e3166a4afb522aa9e0171a4f5ccc23fb183dada93944bedece2e8052c22')

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
