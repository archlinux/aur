# Maintainer: Marco R. <thomasschmidt45@gmx.net>
pkgname=friendiqa
pkgver=0.5.4.1
pkgrel=1
pkgdesc="Client for social network Friendica"
arch=('any')
url="https://git.friendi.ca/lubuwest/Friendiqa"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-webengine' 'qt5-webview' )
source=("$pkgname-$pkgver.tar.gz::https://git.friendi.ca/lubuwest/Friendiqa/archive/v${pkgver}.tar.gz")
md5sums=('bc6ea49694ba480bd77b2914c879368a') #generate with 'makepkg -g'

build() {
  cd "$pkgname/source-linux"
  qmake
  make
}

package() {
  cd "$pkgname/source-linux"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
