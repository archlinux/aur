# Maintainer: artist for XLibre

pkgname=kwin-x11-lite
_pkgname=kwin-x11
pkgver=6.5.3
_pkgver=6.5.3
_pkgtag=6.5.3
pkgrel=1
pkgdesc='kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for XLibre'
arch=(x86_64)
url='https://github.com/KDE-Lite/kwin-x11-lite'
license=(LGPL-2.0-or-later)
depends=(aurorae
         breeze
         gcc-libs
         glibc
         plasma-activities
         kauth
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdeclarative
         kdecoration
         kglobalaccel
         kglobalacceld
         kguiaddons
         ki18n
         kirigami
         kitemmodels
         knewstuff
         knotifications
         kpackage
         kquickcharts
         kscreenlocker
         kservice
         ksvg
         kwidgetsaddons
         kwindowsystem
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
         libplasma=$_pkgver
         mesa
         plasma-x11-session
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-svg
         qt6-tools
         qt6-wayland
         systemd-libs
         wayland
         xcb-util-cursor
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(extra-cmake-modules
             git
             kdoctools
             plasma-wayland-protocols
             python
             wayland-protocols)
provides=($_pkgname $_pkgname-improved)
conflicts=($_pkgname $_pkgname-improved)
source=("git+${url}.git#tag=${_pkgtag}")
install="$pkgname.install"
options=(!debug)
sha256sums=('6a927005f8b2d6b89dd1dc6e2ba956e581e052af510079847d00ec8fb3efb1d9')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

