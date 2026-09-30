# Maintainer: calibancode <17374198+calibancode@users.noreply.github.com>

pkgname=katwhisker
pkgver=0.1.1
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
  'kirigami'
  'kirigami-addons'
  'libstdc++'
  'qqc2-desktop-style'
  'qt6-base'
  'qt6-declarative'
  'qt6-multimedia'
  'qt6-svg'
)
makedepends=('cmake' 'extra-cmake-modules')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c88179be43e0253831ca9407258d13ef5da32d9b3c8012ab9b6a03fdea6963e5')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
