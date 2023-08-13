# Maintainer: tarball <bootctl@gmail.com>

pkgname=ktailctl
pkgver=0.7.0
pkgrel=1
arch=(x86_64 aarch64)
url='https://github.com/f-koehler/KTailctl'
license=(GPL3)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  kconfig
  kcoreaddons
  ki18n
  kirigami-addons
  kirigami2
  knotifications
  qt5-base
  qt5-declarative
  qt5-quickcontrols2
  qt5-svg
  tailscale
)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('619252bdc0d64dd1a5eb40f600b51130845cdfb190e5aac9746939ba7375c735')

build() {
  cmake -B build -S KTailctl-$pkgver \
    -DDBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
