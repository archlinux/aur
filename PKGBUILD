# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=kaichat
pkgver=0.7.0
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
sha256sums=('0cd3891fb6d4aa6a41c3f417e38141c3d1a6cf2b09aaccef8cff0c11fdcb0a2e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
