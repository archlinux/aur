# Maintainer: calibancode <17374198+calibancode@users.noreply.github.com>

pkgname=katwhisker
pkgver=0.3.0
pkgrel=1
pkgdesc='Small web radio player for KDE Plasma, using the radio-browser.info directory'
arch=('x86_64')
url='https://github.com/calibancode/katwhisker'
license=('GPL-3.0-or-later' 'CC-BY-SA-4.0' 'CC0-1.0')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'kcoreaddons'
  'kdbusaddons'
  'ki18n'
  'libstdc++'
  'qt6-base'
  'qt6-multimedia'
  'qt6-svg'
)
makedepends=('cmake' 'extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('12e23c694debb6012980a11fac9e38ef6c4fd0249ec50dc82d0e7f5ca2130d0f')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
