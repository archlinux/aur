# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=kaichat
pkgver=0.6.0
pkgrel=1
pkgdesc='Chat interface for AI models such as ollama'
arch=(x86_64)
url='https://apps.kde.org/kaichat/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         hicolor-icon-theme
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kiconthemes
         kio
         knotifications
         knotifyconfig
         kstatusnotifieritem
         ktextaddons
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         purpose
         sonnet
         qt6-base)
makedepends=(extra-cmake-modules
             kdoctools)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('9af0c4552ff191befcd12b2cd2101acf4bdc42c22a39336a41236cdab1df21c7')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
