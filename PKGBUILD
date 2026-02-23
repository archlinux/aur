pkgname=plasma6-applets-virtual-desktop-bar-wayland
pkgver=1.0.2
pkgrel=2
pkgdesc="Configurable virtual desktop bar widget for KDE Plasma 6"
arch=('x86_64')
url="https://github.com/lenonk/virtual-desktop-bar"
license=('GPL')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-5compat'
  'ki18n'
  'kservice'
  'kwindowsystem'
  'kcmutils'
  'kdeclarative'
  'kirigami'
  'libplasma'
  'plasma-activities'
  'plasma-workspace'
  'kwin'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cmake -B build -S virtual-desktop-bar-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
