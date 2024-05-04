# Maintainer: Marco R. <thomasschmidt45@gmx.net>
pkgname=friendiqa
pkgver=0.6.9
pkgrel=1
pkgdesc="Client for social network Friendica"
arch=('any')
url="https://git.friendi.ca/lubuwest/Friendiqa"
license=('GPL3')
makedepends=('cmake')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-networkauth')
source=("$pkgname-$pkgver.tar.gz::https://git.friendi.ca/lubuwest/Friendiqa/archive/v${pkgver}.tar.gz")
md5sums=('501d776b29ef1e6110cf384aaa1ca2bb') #generate with 'makepkg -g'

build() {
  cmake -B build -S "friendiqa\src" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr'
  cd build
  make
}

package() {
  install -Dm755 build/friendiqa "$pkgdir"/usr/bin/friendiqa
  install -Dm644 "$srcdir"/friendiqa/src/assets/de.manic.Friendiqa.desktop "$pkgdir"/usr/share/applications/de.manic.Friendiqa.desktop
  install -Dm644 "$srcdir"/friendiqa/src/assets/de.manic.Friendiqa.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/de.manic.Friendiqa.svg
}


# vim:set ts=2 sw=2 et:
