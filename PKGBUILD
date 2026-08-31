# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-terminal
pkgver=26.04.3.2
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
sha256sums=('f39685fbc4e47bdc7ce28299b925ff3a92d17ef0e2fe940c05a52f9e3bb44403')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
