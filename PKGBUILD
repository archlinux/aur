# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Marco R. <thomasschmidt45@gmx.net>
pkgname=friendiqa
pkgver=0.5.3
pkgrel=1
pkgdesc="Client for social network Friendica"
arch=('any')
url="https://git.friendi.ca/lubuwest/Friendiqa"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-webengine' 'qt5-webview' )
source=("$pkgname-$pkgver.tar.gz::https://git.friendi.ca/lubuwest/Friendiqa/archive/v${pkgver}.tar.gz")
md5sums=('5a90b6cdf0d782f6337bc2ad321ecb0b') #generate with 'makepkg -g'

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
