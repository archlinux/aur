# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=liquidshell
pkgver=1.10.0
pkgrel=1
pkgdesc='Basic desktop shell using QtWidgets'
arch=(x86_64)
url='https://invent.kde.org/system/liquidshell'
license=(GPL-3.0-or-later)
depends=(bluez-qt
         gcc-libs
         glibc
         karchive
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kiconthemes
         kio
         kitemviews
         knewstuff
         knotifications
         kservice
         kstatusnotifieritem # Dbus
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         networkmanager-qt
         qt6-base
         sh
         solid)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('27adb52c1ee292f853921414b46ac8968f39126c5c7e8afb169abb2736c3f604'
            'SKIP')
validpgpkeys=(3DAB43DA42E08DE44800A2891E674FA08DFB0F86) # Martin Koller <kollix@aon.at>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
