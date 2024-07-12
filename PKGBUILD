# Maintainer: PiyushXCoder <piyushxcoder@gmail.com>

pkgname=powermode-indicator-git
_pkgname=powermode-indicator
pkgver=0.1
pkgrel=1
pkgdesc="It is a plugin for all desktops supported by libappindicator. It provides menu to choose power profiles."
arch=(x86_64)
url="https://github.com/PiyushXCoder/powermode-indicator"
license=(MIT)
depends=(gtk3 libappindicator-gtk3 power-profiles-daemon gtkmm3 glibmm-2.68)
makedepends=(
  cmake
  git
)
source=(
  "git+https://github.com/PiyushXCoder/powermode-indicator.git"
)
b2sums=(
  'SKIP'
)

build() {
  cmake -B build -S "$_pkgname"
  cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

