# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname="plank-player"
pkgver=5.27.11
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
b2sums=('4569e6310bcceb92da7bddf44df2346fa252a235bdd67a407fb2df1b7453a66d34ca8e47fc19ccd82736064f09d0c0c0c6c3b4a964238dff6c79613e1717dbb8')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
