# Maintainer: kamisaki
# Description: Terminal üzerinden Türkçe anime izleme aracı

pkgname=anitr-cli
pkgver=2.0.1
pkgrel=1
pkgdesc="Terminal üzerinden Türkçe anime izleme aracı"
arch=('x86_64')
url="https://github.com/xeyossr/anitr-cli"
license=('GPL-3')
makedepends=('gcc' 'make' 'cmake' 'nlohmann-json')
depends=('curl' 'rofi' 'mpv')
optdepends=('rofi' 'rofi-wayland: For Wayland support') 
source=("https://github.com/xeyossr/anitr-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/anitr-cli-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/anitr-cli-$pkgver/build"
  install -Dm755 anitr-cli "$pkgdir/usr/bin/anitr-cli"
  install -Dm755 animecix-cli "$pkgdir/usr/bin/animecix-cli"
  install -Dm755 openanime-cli "$pkgdir/usr/bin/openanime-cli"
}
