# Maintainer: limonyx
pkgname=omniclicker
pkgver=1.1.2
pkgrel=1
pkgdesc='Native Linux autoclicker for X11 and Wayland-aware sessions'
arch=('x86_64')
url='https://github.com/limonyx/omniclicker'
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'kglobalaccel' 'libx11' 'libxtst' 'qt6-base')
makedepends=('cmake' 'ninja')
install=omniclicker.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9cdd05e6fa53a572dd659b11b73d3d522aae796d804a4a521a3c085cade049d4')

build() {
  cmake -S "$srcdir/$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
