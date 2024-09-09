# Maintainer: outfoxxed <outfoxxed@outfoxxed.me>

pkgname=hy3
pkgver=0.43.0
pkgrel=1
pkgdesc='Hyprland plugin for i3 like tiling'
arch=('x86_64')
url='https://github.com/outfoxxed/hy3'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('gcc-libs' 'glibc' 'hyprland=0.43.0')
conflicts=('hyprland-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/hl$pkgver.tar.gz")
sha256sums=('c9fbd933f34f775b86abe850395673069d14fc0043a34089624722486c06f771')

build() {
  cmake -B build -S "$pkgname-hl$pkgver" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
