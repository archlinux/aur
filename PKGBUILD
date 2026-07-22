pkgname=nvibrant-gui
pkgver=1.0.0
pkgrel=1
pkgdesc='Native Qt6 frontend for NVIDIA Digital Vibrance on Wayland'
arch=('x86_64')
url='https://github.com/JoshuaEve/nvibrant-gui'
license=('MIT')
depends=('qt6-base' 'nvibrant')
makedepends=('cmake' 'ninja' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JoshuaEve/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50c51c2f459cfda768e4c227a3f8e425ed9b67a6eed9c80f55c7117fd97ab621')
build() {
  cmake -S "$srcdir/$pkgname-$pkgver" -B "$srcdir/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$srcdir/build"
}
package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
