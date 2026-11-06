pkgname=skwd-paper-plasma
pkgver=1.0.0_beta.27
pkgrel=1
pkgdesc='KDE Plasma wallpaper integration for Skwd Paper'
arch=(x86_64)
url='https://github.com/liixini/skwd-paper-plasma'
license=(MIT)
depends=(libdrm libglvnd plasma-workspace qt6-base qt6-declarative qt6-tools skwd-paper)
makedepends=(cmake gcc pkgconf)
options=(!debug !lto)
source=("$pkgname-1.0.0-beta.27.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.27/skwd-paper-plasma-1.0.0-beta.27.tar.xz")
sha256sums=('80d68a414b17ab34f20defeb14a1de10bc678016937b7fb98008a8f182865628')

build() {
  cmake -S "$srcdir/skwd-paper-plasma-1.0.0-beta.27" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
