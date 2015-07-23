#Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-tsundere-git
_gitname=fcitx-tsundere
pkgver=0.7.2aba36d
pkgrel=1
pkgdesc="Tsundere module for fcitx, adds something following every character you input."
arch=('i686' 'x86_64')
url="https://github.com/felixonmars/fcitx-tsundere"
license=('GPL')
depends=('fcitx>=4.2.7')
makedepends=('cmake' 'git')
source=('git://github.com/felixonmars/fcitx-tsundere.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install
}

