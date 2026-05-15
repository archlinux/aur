# Maintainer: outfoxxed <outfoxxed@outfoxxed.me>

pkgname=hy3
pkgver=0.55.0
pkgrel=1
pkgdesc='Hyprland plugin for i3 like tiling'
arch=('x86_64')
url='https://github.com/outfoxxed/hy3'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('gcc-libs' 'glibc' 'hyprland=0.55.1')
conflicts=('hyprland-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/hl$pkgver.tar.gz")
sha256sums=('91eaca1e52f5f035fbe02cea560cb70c2b9e3320d7733e386608e0dc631b5922')

build() {
  cmake -B build -S "$pkgname-hl$pkgver" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
