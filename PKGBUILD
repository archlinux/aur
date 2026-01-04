# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=liquidshell
pkgver=1.10.1
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
sha256sums=('4e079293a90c47fc3c862f4aa9472936a4cb8a2c72f16098d234997e86c8364a'
            'SKIP')
validpgpkeys=(3DAB43DA42E08DE44800A2891E674FA08DFB0F86) # Martin Koller <kollix@aon.at>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
