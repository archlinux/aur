# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname="plank-player"
pkgver=26.10.0
pkgrel=1
pkgdesc='Multimedia Player for playing local files on Plasma Bigscreen allowing navigation with just a remote control'
arch=("x86_64")
url='https://plasma-bigscreen.org/'
license=(GPL-2.0-or-later)
depends=(bigscreen-ui-git kconfig ki18n kio kirigami qt6-base qt6-declarative qt6-multimedia hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("https://invent.kde.org/plasma-bigscreen/plank-player/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('SKIP')

build() {
  cmake -B build -S $pkgname-v$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
