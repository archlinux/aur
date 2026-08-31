# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-win
pkgver=6.7.4.3
pkgrel=2
pkgdesc='An easy to use, but flexible, X Window Manager'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-win'
license=(LGPL-2.0-or-later)
depends=(aurorae
         glibc
         kcmutils
         kconfig
         kcrash
         kdeclarative
         ki18n
         kitemmodels
         knewstuff
         knotifications
         kpackage
         kquickcharts
         kservice
         ksvg
         kwidgetsaddons
         kxmlgui
         lcms2
         libcanberra
         libdisplay-info
         libdrm
         libepoxy
         libgcc
         libqaccessibilityclient-qt6
         libstdc++
         libx11
         libxcb
         libxi
         libxkbcommon
         libxkbcommon-x11
         mesa
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-svg
         qt6-tools
         sonic-activities
         sonic-decoration
         sonic-frameworks-auth
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-idle-tracker
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-keybind-daemon
         sonic-night-light
         sonic-screenlocker
         sonic-silver
         systemd-libs
         xcb-util-cursor
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(python
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
provides=(kwin-x11)
conflicts=(kwin-x11)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
install="$pkgname.install"
sha256sums=('df7f7f39741da7d4abace2259b05f31ceaed818e1bf599f7d1c407cfecf56f95')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
