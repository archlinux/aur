# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname="plank-player"
pkgver=5.27.12
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Multimedia Player for playing local files on Plasma Bigscreen allowing navigation with just a remote control'
arch=("x86_64")
url='https://plasma-bigscreen.org/'
license=(GPL2)
# 6
#depends=(kirigami ki18n qt6-multimedia qt6-graphicaleffects hicolor-icon-theme)
# 5
depends=(kirigami2 ki18n5 qt5-multimedia qt5-graphicaleffects hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz")
b2sums=('bb7604f17b8b6e19c6a2490c4905f8fe07b4f7f06df1dfba5d403c0a51d97b1030c8272ff7627d682910c4fd75b63b532d1e86ef4aa8a45deb5882014b39defa')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
