# Maintainer: Diego M. <15237757+Helix128@users.noreply.github.com>
pkgname=lenovo-fanboost-gui
pkgver=0.1.1
pkgrel=1
pkgdesc="Native Qt6 companion GUI for lenovo-fanboost"
arch=('x86_64')
url="https://github.com/Helix128/lenovo-fanboost-gui"
license=('GPL-2.0-only')
depends=('qt6-base' 'hicolor-icon-theme' 'polkit' 'lenovo-fanboost')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('475264148978fa4b45e2f0a2c39fe94faba4be64571dfcccd248362e76878308')

build() {
  cmake -B "build-$pkgver" -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "build-$pkgver"
}

package() {
  DESTDIR="$pkgdir" cmake --install "build-$pkgver"
}
