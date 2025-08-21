# Maintainer: artist for Artix Linux

pkgname=kwin-x11-improved
_pkgname=kwin-x11
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=3
pkgdesc='kwin_x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for Xlibre and Xorg-git'
arch=(x86_64)
url='https://github.com/josephcrowell/kwin-x11-improved'
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
         mesa
         libplasma
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
groups=(plasma)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/josephcrowell/kwin-x11-improved.git#tag=v$pkgver")
install="$pkgname.install"
sha256sums=('83d4d0d77d0fd5599feb20ba83c6d57172f667233d99942396fa23dee997dd5b')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

