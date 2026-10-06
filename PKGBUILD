# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>

pkgname=sonic-breeze
_pkgname=sonic-breeze
pkgver=6.7.5
pkgrel=2
pkgdesc='Highly customizable binary Window Decoration, Application Style and Global Theme plugin for SonicDE.'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-breeze'
license=('LGPL-2.0-or-later')
depends=(frameworkintegration
         gcc-libs
         glibc
         hicolor-icon-theme
         kcmutils
         kcolorscheme
         kconfig
         ki18n
         kiconthemes
         kwidgetsaddons
         libstdc++
         qt6-base
         qt6-declarative
         qt6-svg
         sonic-decoration
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-icon-themes
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         sonic-silver
         sonic-silver-icons
         xdg-utils)
makedepends=(sonic-frameworks-cmake-modules)
conflicts=(breeze-cursors)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('927307907a5c5af11e48ee5c426d17c3dbae3826f005ce9b0ea2de408ccb6422')

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
