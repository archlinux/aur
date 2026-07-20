# Maintainer: Marco R. <thomasschmidt45@gmx.net>
pkgname=friendiqa
pkgver=0.7.1
pkgrel=1
pkgdesc="Client for social network Friendica"
arch=('any')
url="https://codeberg.org/lubuwest/Friendiqa"
license=('GPL3')
makedepends=('cmake')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-networkauth' 'qt6-imageformats')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/lubuwest/Friendiqa/archive/v${pkgver}.tar.gz")
md5sums=('44e6ffdf9a8fc9590a0f09c3aa080bb4') #generate with 'makepkg -g'

build() {
  cmake -B build -S "friendiqa\src" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr'
  cd build
  make
}

package() {
  install -Dm755 build/friendiqa "$pkgdir"/usr/bin/friendiqa
  install -Dm644 "$srcdir"/friendiqa/src/assets/de.manic.friendiqa.desktop "$pkgdir"/usr/share/applications/de.manic.friendiqa.desktop
  install -Dm644 "$srcdir"/friendiqa/src/assets/de.manic.friendiqa.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/de.manic.friendiqa.svg
}


# vim:set ts=2 sw=2 et:
