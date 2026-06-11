# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-win
pkgver=6.6.5.1
pkgrel=2
pkgdesc='An easy to use, but flexible, X Window Manager'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-win'
license=(LGPL-2.0-or-later)
depends=(aurorae
         breeze
         gcc-libs
         glibc
         kcmutils
         kcolorscheme
         kconfig
         kcrash
         kdeclarative
         ki18n
         kitemmodels
         knewstuff
         knighttime
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
         libqaccessibilityclient-qt6
         libx11
         libxcb
         libxi
         libxkbcommon
         libxkbcommon-x11
         mesa
         plasma-x11-session
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-svg
         qt6-tools
         sonic-activities
         sonic-decoration
         sonic-frameworks-auth
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-keybind-daemon
         sonic-screenlocker
         systemd-libs
         wayland
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
sha256sums=('ef1e7da51724cafb3fdd133451651163e2208d9dcc1d42e5c1e706d5ac27fd3c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
