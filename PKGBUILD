pkgname=skwd-paper-plasma
pkgver=1.0.0_beta.29
pkgrel=1
pkgdesc='KDE Plasma wallpaper integration for Skwd Paper'
arch=(x86_64)
url='https://github.com/liixini/skwd-paper-plasma'
license=(MIT)
depends=(libdrm libglvnd plasma-workspace qt6-base qt6-declarative qt6-tools skwd-paper)
makedepends=(cmake gcc pkgconf)
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.29.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.29/skwd-paper-plasma-1.0.0-beta.29.tar.xz")
sha256sums=('c85ff7da28256eb55e0b216259b49cccbc2969f9762fdafc01553895a083138c')

build() {
  cmake -S "$srcdir/skwd-paper-plasma-1.0.0-beta.29" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
