# Maintainer: outfoxxed <outfoxxed@outfoxxed.me>

pkgname=hy3
pkgver=0.52.0
pkgrel=1
pkgdesc='Hyprland plugin for i3 like tiling'
arch=('x86_64')
url='https://github.com/outfoxxed/hy3'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('gcc-libs' 'glibc' 'hyprland=0.52.1')
conflicts=('hyprland-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/hl$pkgver.tar.gz")
sha256sums=('eb019d16de373fcb13abde49c2cd3e156a36c5d700bc6c9843a595597d3f707d')

build() {
  cmake -B build -S "$pkgname-hl$pkgver" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
