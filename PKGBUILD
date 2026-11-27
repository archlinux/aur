# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=kaichat
pkgver=0.9.0
pkgrel=1
pkgdesc='Chat interface for AI models such as ollama'
arch=(x86_64)
url='https://apps.kde.org/kaichat/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         hicolor-icon-theme
         kcmutils
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
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
         shared-mime-info
         sonnet
         syntax-highlighting
         qt6-base)
makedepends=(extra-cmake-modules
             kdoctools)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('5c4899ec180b9fecb834d975da0ff73b8bcccf4d05d45a94c753cac4c0fdbc20')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
