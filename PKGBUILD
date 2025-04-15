# Maintainer: Marcos_Chay <maktio@hotmail.com>

pkgname=spacebar
pkgver=6.3.4
pkgrel=1
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
sha256sums=('fe1b7c5651baabcf580041cf1616ede4ad434ae84f0838464e9082d1e4f1e633')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
