# Maintainer: calibancode <17374198+calibancode@users.noreply.github.com>

pkgname=katwhisker
pkgver=0.2.0
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
sha256sums=('6b22537555d504d8239956e958b6d962b5e070c2b65b9f309cd243523c36d272')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
