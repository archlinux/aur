# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-nano
pkgver=6.0.3
pkgrel=0
pkgdesc="A minimal plasma shell package intended for embedded devices."
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma/plasma-nano"
license=('GPL2')
groups=()
depends=(
  plasma-workspace
  kwindowsystem
  ki18n
  kservice
  kitemmodels
  qt6-svg
)
makedepends=('cmake' 'extra-cmake-modules') 
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('9818ce904f18304d30b22acd713980577de6cc0bd75ea0cfb64bed250d004b2a')

prepare() {
  mkdir -p build
}

build() {

    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
 
