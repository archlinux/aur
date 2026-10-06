# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-settings-ui
pkgver=6.30.0
pkgrel=1
pkgdesc='Widgets for configuration dialogs'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-settings-ui'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(glibc
         kcodecs
         kconfig
         ki18n
         kwidgetsaddons
         libstdc++
         qt6-base
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons)
makedepends=(doxygen
             qt6-tools
             sonic-frameworks-cmake-modules)
provides=(kconfigwidgets)
conflicts=(kconfigwidgets)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('595b5081fade271032eb45dd09343de0a0574f3046f6caf25f60c90fdeb36ee9')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
