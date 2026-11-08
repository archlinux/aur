# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname="plank-player"
pkgver=26.11.0
pkgrel=1
pkgdesc='Multimedia Player for playing local files on Plasma Bigscreen allowing navigation with just a remote control'
arch=("x86_64")
url='https://plasma-bigscreen.org/'
license=(GPL-2.0-or-later)
depends=(bigscreen-ui-git kconfig ki18n kio kirigami qt6-base qt6-declarative qt6-multimedia hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("https://invent.kde.org/plasma-bigscreen/plank-player/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('8e416d57e4eb6ee4e15b93de84aa4395e72b0c4dece5b0f158441574209d1eeed0adb23e87b67b3ce2bb91b91590af392d5c3c194da623813575c58acbbaeb4b')

build() {
  cmake -B build -S $pkgname-v$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
