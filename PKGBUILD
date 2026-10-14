# Maintainer: rDev <proshiv85@gmail.com>
pkgname=kvant
pkgver=0.1.0
pkgrel=1
pkgdesc='A clean Material 3 audio player'
arch=('x86_64' 'aarch64')
url='https://github.com/proshiv85-byte/kvant'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'taglib' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja')
optdepends=('qt6-multimedia-ffmpeg: FFmpeg playback backend (recommended)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f218eb8ab6584ffc60b580d56aba342798e93a91f9d29e5bc103cd1a434213a2')

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
