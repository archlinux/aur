# Maintainer: Jerzy Kołosowski <jerzy@kolosowscy.pl>

pkgname=plasma-screencastborder-effect
pkgver=1.0.0
pkgrel=1
pkgdesc='Visual border indicator effect for active screencasts in KDE Plasma'
arch=(x86_64)
url='https://github.com/jkolo/plasma-screencastborder-effect'
license=(GPL-2.0-or-later)
depends=(kwin-screencast-api
         qt6-base
         kf6-kconfig
         kf6-kcoreaddons
         kf6-ki18n
         kf6-kcmutils)
makedepends=(extra-cmake-modules
             qt6-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jkolo/plasma-screencastborder-effect/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
