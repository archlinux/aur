# Maintainer: Marco R. <thomasschmidt45@gmx.net>
pkgname=friendiqa
pkgver=0.6.7
pkgrel=1
pkgdesc="Client for social network Friendica"
arch=('any')
url="https://git.friendi.ca/lubuwest/Friendiqa"
license=('GPL3')
makedepends=('cmake')
depends=('qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-quickcontrols2' )
source=("$pkgname-$pkgver.tar.gz::https://git.friendi.ca/lubuwest/Friendiqa/archive/v${pkgver}.tar.gz")
md5sums=('ce9b3ebad5b729dd5ac15fc2f189599a') #generate with 'makepkg -g'

build() {
  cmake -B build -S "friendiqa\source-linux" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr'
  cd build
  make
}

package() {
  install -Dm755 build/friendiqa "$pkgdir"/usr/bin/friendiqa
  install -Dm644 "$srcdir"/friendiqa/source-linux/images/de.manic.Friendiqa.desktop "$pkgdir"/usr/share/applications/de.manic.Friendiqa.desktop
  install -Dm644 "$srcdir"/friendiqa/source-linux/images/de.manic.Friendiqa.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/de.manic.Friendiqa.svg
}


# vim:set ts=2 sw=2 et:
