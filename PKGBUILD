# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

# Modified from aur/fcitx5-chinese-addons-git. Original maintainers:
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-chewing-git
pkgver=r101.c0f98be
pkgrel=3
pkgdesc="Fcitx5 addon for Chewing"
arch=('i686' 'x86_64')
url="https://gitlab.com/fcitx/fcitx5-chewing"
license=('GPL2')
depends=('libchewing-git' 'fcitx5-git' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'git')
source=("git+https://gitlab.com/fcitx/fcitx5-chewing.git")
sha512sums=('SKIP')

pkgver() {
  cd fcitx5-chewing

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd fcitx5-chewing

  cmake . \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib

  make
}

package() {
  cd fcitx5-chewing

  make DESTDIR="$pkgdir" install
}
