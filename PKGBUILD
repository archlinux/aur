# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bernhard Landauer <bernhard@manjaro.org>
# Contributor: dodgejcr@gmail.com
# Contributor: Bhushan Shah <bhush94 at gmail dot com>

pkgname=spacebar
pkgver=6.3.3
pkgrel=1
epoch=1
pkgdesc="SMS and messaging application for Mobile Devices running Plasma"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://community.kde.org/Plasma/Mobile"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  'c-ares'
  'futuresql-qt6'
  'kconfig'
  'kcoreaddons'
  'kcontacts'
  'kdbusaddons'
  'ki18n'
  'kio'
  'kirigami'
  'kirigami-addons'
  'knotifications'
  'kpeople'
  'kwindowsystem'
  'libphonenumber'
  'modemmanager-qt'
  'qcoro-qt6'
  'qt6-declarative'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('3b332bf4a31f729c3ef96887064c999c307014405781c4d7e996b722d1715db4')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
