# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-screenies
pkgver=6.7.5.2
pkgrel=1
pkgdesc='SonicDE screenshot capture utility'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-screenies'
license=(GPL-2.0-or-later)
depends=(glibc
         kconfig
         kcrash
         kdbusaddons
         ki18n
         kjobwidgets
         knotifications
         kservice
         kstatusnotifieritem
         kwidgetsaddons
         kxmlgui
         libgcc
         libstdc++
         libxcb
         opencv
         prison
         purpose
         qt6-base
         qt6-declarative
         qt6-imageformats
         qt6-multimedia
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-io
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-settings-ui
         sonic-frameworks-windowsystem
         sonic-pipewire
         sonic-quick-image-editor
         tesseract
         xcb-util
         xcb-util-cursor
         xcb-util-image)
makedepends=(sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
provides=(spectacle)
conflicts=(spectacle)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4ec04d9996fe59fc84146e6af02d58f9f8ffac2fe42abb2b11c0cc4b16091b75')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
