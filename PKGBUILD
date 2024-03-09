# Maintainer: Volodymyr Zolotopupov <zvova7890@gmail.com>

pkgname=ksysguard6-git
pkgver=6.0.1
pkgrel=1
pkgdesc='Track and control the processes running in your system. KF6 version'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(gcc-libs
         glibc
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kdbusaddons
         ki18n
         kiconthemes
         kio
         knewstuff
         knotifications
         ksystemstats
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libksysguard
         lm_sensors
         qt6-base
         zlib)
makedepends=(extra-cmake-modules
             kdoctools)
source=(git+https://invent.kde.org/vvova/ksysguard.git#branch=kf6)
sha256sums=('SKIP')

build() {
  cmake -B build -S ksysguard \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
