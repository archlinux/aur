pkgname=skwd-paper-plasma
pkgver=1.0.0_beta.26
pkgrel=2
pkgdesc='KDE Plasma wallpaper integration for Skwd Paper'
arch=(x86_64)
url='https://github.com/liixini/skwd-paper-plasma'
license=(MIT)
depends=(libdrm libglvnd plasma-workspace qt6-base qt6-declarative qt6-tools skwd-paper)
makedepends=(cmake gcc pkgconf)
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.26.tar.gz::https://github.com/liixini/skwd-paper-plasma/archive/refs/tags/v1.0.0-beta.26.tar.gz")
sha256sums=('1e9ebcaf40b2df5d16ba698a3b302d9d5ae0641f4abab9deeccdbc9162ca7a9e')

build() {
  cmake -S "$srcdir/skwd-paper-plasma-1.0.0-beta.26" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
