# Maintainer: outfoxxed <outfoxxed@outfoxxed.me>

pkgname=hy3
pkgver=0.53.0
pkgrel=1
pkgdesc='Hyprland plugin for i3 like tiling'
arch=('x86_64')
url='https://github.com/outfoxxed/hy3'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('gcc-libs' 'glibc' 'hyprland=0.53.2')
conflicts=('hyprland-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/hl$pkgver.tar.gz")
sha256sums=('de07ba8c4f466c19077c62e15b97538c8bb3c2da600f587bb89d3b8372582edc')

build() {
  cmake -B build -S "$pkgname-hl$pkgver" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
