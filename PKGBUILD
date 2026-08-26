# Maintainer: limonyx
pkgname=omniclicker
pkgver=1.1.6
pkgrel=1
pkgdesc='Native Linux autoclicker for X11 and Wayland-aware sessions'
arch=('x86_64')
url='https://github.com/limonyx/omniclicker'
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'kglobalaccel' 'libx11' 'libxtst' 'qt6-base')
makedepends=('cmake' 'ninja')
install=omniclicker.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('19961d710e5a8d662655ff41a065b00fd078eb2b28d7b40638ed23744b95f216')

build() {
  cmake -S "$srcdir/$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
