# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-terminal
pkgver=26.08.0
pkgrel=1
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-terminal'
pkgdesc='SonicDE terminal emulator'
license=(GPL-2.0-or-later
         LGPL-2.0-or-later)
depends=(glibc
         icu
         kbookmarks
         kconfig
         kcrash
         kdbusaddons
         ki18n
         knewstuff
         knotifications
         knotifyconfig
         kparts
         kpty
         kservice
         ktextwidgets
         kwidgetsaddons
         kxmlgui
         libssh
         libstdc++
         libxkbcommon
         qt6-base
         qt6-multimedia
         sh
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-icon-themes
         sonic-frameworks-io
         sonic-frameworks-keybind
         sonic-frameworks-settings-ui
         sonic-frameworks-windowsystem)
makedepends=(sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
optdepends=('keditbookmarks: to manage bookmarks')
provides=(konsole)
conflicts=(konsole)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('385b85f60609a18ea9e041c05ddc1f61730cf91bf8661d5a1f16a67dc91c6df9')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
