# Maintainer: outfoxxed <outfoxxed@outfoxxed.me>

pkgname=hy3
pkgver=0.47.0
pkgrel=1
pkgdesc='Hyprland plugin for i3 like tiling'
arch=('x86_64')
url='https://github.com/outfoxxed/hy3'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('gcc-libs' 'glibc' 'hyprland=0.47.1')
conflicts=('hyprland-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/hl$pkgver.tar.gz")
sha256sums=('5fd3dabb7347a690d1a1030fe70a4811305fff653dc5e1faf87f24bfa63f2ace')

build() {
  cmake -B build -S "$pkgname-hl$pkgver" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
