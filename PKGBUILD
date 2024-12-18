# Maintainer: Javs <admin@fxs.life>

pkgname=fcitx5-pangu-git
_gitname=fcitx5-pangu
pkgver=0.8
pkgrel=1
pkgdesc="pangu module for fcitx5, insert space between CJK and alphabet characters"
arch=('i686' 'x86_64')
url="https://github.com/Fei-xiangShi/fcitx5-pangu.git"
license=('GPL')
depends=('fcitx5')
makedepends=('cmake' 'git' 'extra-cmake-modules')
source=('git+https://github.com/Fei-xiangShi/fcitx5-pangu.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install
}
