# Maintainer: lilydjwg <lilydjwg@gmail.com>

pkgname=fcitx5-paste-primary-git
_gitname=fcitx5-paste-primary
pkgver=0.16
pkgrel=3
pkgdesc="Paste-primary module for fcitx, paste primary selection with keyboard shortcut."
arch=('i686' 'x86_64')
url="https://github.com/lilydjwg/fcitx5-paste-primary"
license=('GPL-2.0-or-later')
depends=('fcitx5')
makedepends=('cmake' 'git' 'extra-cmake-modules')
optdepends=('wl-clipboard: for Wayland support')
source=('git+https://github.com/lilydjwg/fcitx5-paste-primary.git')
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

