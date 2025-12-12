# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=kaichat
pkgver=0.5.1
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
sha256sums=('545980cd4889fced1889e53cf742ac8d538e3aaeb0d7e7bfcb8115b66e0d83a7')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
