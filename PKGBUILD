# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=liquidshell
pkgver=1.9.0
pkgrel=3
pkgdesc='Basic desktop shell using QtWidgets'
arch=(x86_64)
url='https://invent.kde.org/system/liquidshell'
license=(GPL3)
depends=(bluez-qt5
         gcc-libs
         glibc
         karchive5
         kcmutils5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kcrash5
         kdbusaddons5
         ki18n5
         kiconthemes5
         kio5
         kitemviews5
         knewstuff5
         knotifications5
         kservice5
         kwidgetsaddons5
         kwindowsystem5
         kxmlgui5
         networkmanager-qt5
         qt5-base
         qt5-x11extras
         solid5)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('dfc450fcead1cfbcb071ebfcf2fbf88e6ae8658b2448382128a42c9bc7773951'
            'SKIP')
validpgpkeys=(3DAB43DA42E08DE44800A2891E674FA08DFB0F86) # Martin Koller <kollix@aon.at>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
