# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=kaichat
pkgver=0.5.0
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
sha256sums=('166a771f25ea7452ced120d0608a99833a9e2ac2f179c0f175805cb0ac557ca1')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
