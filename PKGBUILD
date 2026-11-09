pkgname=skwd-paper-plasma
pkgver=1.0.0_beta.28
pkgrel=1
pkgdesc='KDE Plasma wallpaper integration for Skwd Paper'
arch=(x86_64)
url='https://github.com/liixini/skwd-paper-plasma'
license=(MIT)
depends=(libdrm libglvnd plasma-workspace qt6-base qt6-declarative qt6-tools skwd-paper)
makedepends=(cmake gcc pkgconf)
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.28.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.28/skwd-paper-plasma-1.0.0-beta.28.tar.xz")
sha256sums=('029a6588ba1b782ee954a120781d1f26794dca4551422e98e2815d95d1291ce5')

build() {
  cmake -S "$srcdir/skwd-paper-plasma-1.0.0-beta.28" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
