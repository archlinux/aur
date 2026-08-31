# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=sonic-qt-theme-bridge
pkgver=6.7.4
pkgrel=1
pkgdesc='Qt Platform Theme integration plugins for the SonicDE workspaces'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-qt-theme-bridge'
license=(LGPL-2.0-or-later)
depends=(glibc
         kconfig
         ki18n
         kjobwidgets
         kservice
         kstatusnotifieritem
         kwidgetsaddons
         libstdc++
         libxcb
         libxcursor
         noto-fonts
         qqc2-breeze-style
         qqc2-desktop-style
         qt6-base
         qt6-declarative
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-icon-themes
         sonic-frameworks-io
         sonic-frameworks-windowsystem
         ttf-hack)
makedepends=(sonic-frameworks-cmake-modules)
provides=(plasma-integration)
conflicts=(plasma-integration)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d2eaf97c667f83f9a62417c970533b265749b1a3b9e6541a4e2136ef640bb984')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
